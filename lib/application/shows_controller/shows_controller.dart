import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_series/domain/shows/i_shows_service_facade.dart';
import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/domain/shows/show_service_failure.dart';

@injectable
class ShowsController extends GetxController {
  final IShowsServiceFacade _showsService;
  RxBool isShowpageLoading = false.obs;

  RxInt showPageIndex = 1.obs;
  RxInt memoryIndex = 0.obs;

  final RxList<Show> memoryShowList = <Show>[].obs;
  final RxList<Show> toLoadShowList = <Show>[].obs;

  ShowsController(this._showsService);

  getMainShowList() => toLoadShowList;
  addToPageIndex() => showPageIndex++;

  getMainScreenShowsList(showErrorSnackBar) async {
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

  initializeShowLists(showErrorSnackBar) async {
    await getMainScreenShowsList(showErrorSnackBar);
    setToLoadShowList();
  }
}
