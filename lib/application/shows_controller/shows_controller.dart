import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_series/domain/shows/i_shows_service_facade.dart';
import 'package:mock_series/domain/shows/models/episode.dart';
import 'package:mock_series/domain/shows/models/season.dart';
import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/domain/shows/show_service_failure.dart';

@injectable
class ShowsController extends GetxController {
  final IShowsServiceFacade _showsService;

  RxBool isMainScreenLoading = false.obs;
  RxBool isSearchLoading = false.obs;
  RxBool isShowScreenLoading = false.obs;

  RxInt showPageIndex = 1.obs;
  RxInt memoryIndex = 0.obs;

  final RxList<Show> memoryShowList = <Show>[].obs;
  final RxList<Show> toLoadShowList = <Show>[].obs;

  final RxList<Show> searchShowList = <Show>[].obs;

  final RxList<Season> showSeasonsList = <Season>[].obs;
  final RxMap<int, List<Episode>> episodesBySeasonMap =
      <int, List<Episode>>{}.obs;
  ShowsController(this._showsService);

  final Rx<Season> selectedSeason = Rx(const Season(
    id: 0,
    name: '',
    number: 1,
    url: '',
  ));
  final RxList<Episode> selectedSeasonEpisodes = <Episode>[].obs;

  initializeShowLists({required showErrorSnackBar}) async {
    await getMainScreenShowsList(showErrorSnackBar: showErrorSnackBar);
    appendToLoadShowList();
  }

  addToPageIndex() => showPageIndex++;

  getMainScreenShowsList({required showErrorSnackBar}) async {
    isMainScreenLoading.value = true;
    Either<ShowServiceFailure, List<Show>> showListOption =
        await _showsService.getShowsPage(page: showPageIndex.value);
    isMainScreenLoading.value = false;
    showListOption.fold(
        (f) => showErrorSnackBar(f),
        // ignore: avoid_function_literals_in_foreach_calls
        (showsList) => showsList.forEach((element) {
              memoryShowList.add(element);
            }));
  }

  appendToLoadShowList() {
    const int loadPerCall = 16;
    int nextMemoryIndex = loadPerCall + memoryIndex.value;
    for (int i = memoryIndex.value;
        i < nextMemoryIndex && i < memoryShowList.length;
        i++) {
      toLoadShowList.add(memoryShowList[i]);
    }
    memoryIndex.value = nextMemoryIndex;
  }

  searchShows({required String search, required showErrorSnackBar}) async {
    isSearchLoading.value = true;
    Either<ShowServiceFailure, List<Show>> showListOption =
        await _showsService.getShowsSearch(search: search);
    isSearchLoading.value = false;
    showListOption.fold(
        (f) => showErrorSnackBar(f),
        // ignore: avoid_function_literals_in_foreach_calls
        (showsList) => searchShowList.value = showsList);
  }

  setShowScreenInitialData(
      {required Show show, required showErrorSnackBar}) async {
    isShowScreenLoading.value = false;

    await _setShowSeasons(
        showId: show.id, showErrorSnackBar: showErrorSnackBar);
    for (Season season in showSeasonsList) {
      await appendToEpisodesBySeasonMap(
          seasonId: season.id!, showErrorSnackBar: showErrorSnackBar);
    }
  }

  _setShowSeasons({required int showId, required showErrorSnackBar}) async {
    Either<ShowServiceFailure, List<Season>> seasonsListOption =
        await _showsService.getShowSeasons(showId: showId);

    seasonsListOption.fold(
        (f) => showErrorSnackBar(f),
        // ignore: avoid_function_literals_in_foreach_calls
        (seasonsList) => showSeasonsList.value = seasonsList);
  }

  appendToEpisodesBySeasonMap(
      {required int seasonId, required showErrorSnackBar}) async {
    Either<ShowServiceFailure, List<Episode>> episodesListOption =
        await _showsService.getShowSeasonEpisodes(seasonId: seasonId);

    episodesListOption.fold((f) => showErrorSnackBar(f),
        // ignore: avoid_function_literals_in_foreach_calls
        (episodesList) {
      episodesBySeasonMap[seasonId] = episodesList;
    });
  }

  restartSelectedSeason() {
    selectedSeason.value = showSeasonsList[0];
    setSelectedSeasonEpisodes(selectedSeasonId: selectedSeason.value.id!);
  }

  setSelectedSeasonEpisodes({required int selectedSeasonId}) {
    selectedSeasonEpisodes.value = episodesBySeasonMap[selectedSeasonId]!;
  }
}
