import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_series/domain/shows/i_shows_service_facade.dart';
import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/domain/shows/show_service_failure.dart';

@injectable
class ShowsController extends GetxController {
  final IShowsServiceFacade _showsService;
  RxInt showPageIndex = 1.obs;
  final RxList<Show> mainShowList = <Show>[].obs;
  ShowsController(this._showsService);

  getMainShowList() => mainShowList;

  getMainScreenShowsList(showErrorSnackBar) async {
    Either<ShowServiceFailure, List<Show>> showListOption =
        await _showsService.getShowsPage(page: showPageIndex.value);
    showListOption.fold((f) => showErrorSnackBar(f),
        (showsList) => mainShowList.value = showsList);
  }
}
