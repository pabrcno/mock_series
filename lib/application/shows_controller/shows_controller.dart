import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_series/domain/shows/i_shows_service_facade.dart';

@injectable
class ShowsController extends GetxController {
  final IShowsServiceFacade _showsService;
  RxInt showPageIndex = 1.obs;
  ShowsController(this._showsService);

  getMainScreenShowsList() async {
    print(await _showsService.getShowsPage(page: showPageIndex.value));
  }
}
