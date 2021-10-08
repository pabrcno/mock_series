import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_series/domain/shows/i_shows_service_facade.dart';
import 'package:mock_series/domain/shows/models/season.dart';
import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/domain/shows/show_service_failure.dart';

@injectable
class ShowsController extends GetxController {
  final IShowsServiceFacade _showsService;
  RxBool isShowpageLoading = false.obs;
  RxBool isSearchLoading = false.obs;

  RxInt showPageIndex = 1.obs;
  RxInt memoryIndex = 0.obs;

  final RxList<Show> memoryShowList = <Show>[].obs;
  final RxList<Show> toLoadShowList = <Show>[].obs;

  final RxList<Show> searchShowList = <Show>[].obs;

  final RxList<Season> showSeasonsList = <Season>[].obs;
  ShowsController(this._showsService);

  initializeShowLists({required showErrorSnackBar}) async {
    await getMainScreenShowsList(showErrorSnackBar: showErrorSnackBar);
    setToLoadShowList();
  }

  addToPageIndex() => showPageIndex++;

  getMainScreenShowsList({required showErrorSnackBar}) async {
    isShowpageLoading.value = true;
    Either<ShowServiceFailure, List<Show>> showListOption =
        await _showsService.getShowsPage(page: showPageIndex.value);
    isShowpageLoading.value = false;
    showListOption.fold(
        (f) => showErrorSnackBar(f),
        // ignore: avoid_function_literals_in_foreach_calls
        (showsList) => showsList.forEach((element) {
              memoryShowList.add(element);
            }));
  }

  setToLoadShowList() {
    const int loadPerCall = 25;
    int nextMemoryIndex = loadPerCall + memoryIndex.value;
    for (int i = memoryIndex.value;
        i < nextMemoryIndex && i < memoryShowList.length;
        i++) {
      toLoadShowList.add(memoryShowList[i]);
    }
    memoryIndex.value = nextMemoryIndex;
  }

  searchShows({required search, required showErrorSnackBar}) async {
    isSearchLoading.value = true;
    Either<ShowServiceFailure, List<Show>> showListOption =
        await _showsService.getShowsSearch(search: search);
    isSearchLoading.value = false;
    showListOption.fold(
        (f) => showErrorSnackBar(f),
        // ignore: avoid_function_literals_in_foreach_calls
        (showsList) => searchShowList.value = showsList);
  }

  _setShowSeasons({required int showId, required showErrorSnackBar}) async {
    Either<ShowServiceFailure, List<Season>> seasonsListOption =
        await _showsService.getShowSeasons(showId: showId);
    isSearchLoading.value = false;
    seasonsListOption.fold(
        (f) => showErrorSnackBar(f),
        // ignore: avoid_function_literals_in_foreach_calls
        (seasonsList) => showSeasonsList.value = seasonsList);
  }
}
