import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_series/domain/shows/i_shows_service_facade.dart';
import 'package:mock_series/domain/shows/models/episode.dart';
import 'package:mock_series/domain/shows/models/season.dart';
import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/domain/shows/show_service_failure.dart';
import 'package:flutter/material.dart';

@injectable
class ShowsController extends GetxController {
  final IShowsServiceFacade _showsService;

  RxBool isMainScreenLoading = false.obs;
  RxBool isSearchLoading = false.obs;
  RxBool isShowScreenLoading = false.obs;

  RxInt showPageIndex = 0.obs;
  RxInt memoryIndex = 0.obs;

  final RxList<Show> memoryShowList = <Show>[].obs;

  final RxList<Show> searchShowList = <Show>[].obs;

  final RxList<Season> showSeasonsList = <Season>[].obs;
  final RxMap<int, List<Episode>> episodesBySeasonMap =
      <int, List<Episode>>{}.obs;

  final Rx<Season> selectedSeason = Rx(const Season(
    id: 0,
    name: '',
    number: 1,
    url: '',
  ));
  final RxList<Episode> selectedSeasonEpisodes = <Episode>[].obs;

  ShowsController(this._showsService) {
    initializeShowLists();
  }

  initializeShowLists() async {
    await addToShowsList();
  }

  addToShowsList() async {
    isMainScreenLoading.value = true;
    showPageIndex++;
    Either<ShowServiceFailure, List<Show>> showListOption =
        await _showsService.getShowsPage(page: showPageIndex.value);
    isMainScreenLoading.value = false;
    showListOption.fold((f) => showShowsSnackBar(f), (showsList) {
      for (var element in showsList) {
        memoryShowList.add(element);
      }
    });
  }

  searchShows({required String search}) async {
    isSearchLoading.value = true;
    Either<ShowServiceFailure, List<Show>> showListOption =
        await _showsService.getShowsSearch(search: search);
    isSearchLoading.value = false;
    showListOption.fold((f) => showShowsSnackBar(f),
        (showsList) => searchShowList.value = showsList);
  }

  setShowScreenInitialData({required Show show}) async {
    isShowScreenLoading.value = true;
    await _setShowSeasons(showId: show.id);
    for (Season season in showSeasonsList) {
      await appendToEpisodesBySeasonMap(seasonId: season.id!);
    }
    restartSelectedSeason();
    isShowScreenLoading.value = false;
  }

  _setShowSeasons({required int showId}) async {
    Either<ShowServiceFailure, List<Season>> seasonsListOption =
        await _showsService.getShowSeasons(showId: showId);

    seasonsListOption.fold((f) => showShowsSnackBar(f),
        (seasonsList) => showSeasonsList.value = seasonsList);
  }

  appendToEpisodesBySeasonMap({required int seasonId}) async {
    Either<ShowServiceFailure, List<Episode>> episodesListOption =
        await _showsService.getShowSeasonEpisodes(seasonId: seasonId);

    episodesListOption.fold((f) => showShowsSnackBar(f), (episodesList) {
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

showShowsSnackBar(ShowServiceFailure f) {
  if (Get.isSnackbarOpen!) return;
  return Get.showSnackbar(
    GetBar(
      title: f.map(
        notFound: (_) => "Show not found 😕",
        rateLimit: (_) => "Wait 10 seconds and try again!🕒",
        serverError: (_) => "There was a server error 📠",
        timeout: (_) => "Maybe your connection is broken 🌐",
        unauthorized: (_) => "Unauthorized",
        unexpectedError: (_) => "Something unexpected happened, try again!",
      ),
      message: "There was an error",
      backgroundColor: Colors.red,
      isDismissible: true,
      duration: const Duration(seconds: 2),
    ),
  );
}
