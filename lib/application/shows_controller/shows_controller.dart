import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_series/domain/shows/i_shows_service_facade.dart';
import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/domain/shows/show_service_failure.dart';

@injectable
class ShowsController extends GetxController {
  final IShowsServiceFacade _showsService;
  RxInt showPageIndex = 1.obs;
  RxBool isShowpageLoading = false.obs;
  final RxList<Show> mainShowList = <Show>[].obs;
  ShowsController(this._showsService);

  getMainShowList() => mainShowList;
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
              mainShowList.add(element);
            }));
  }
}
