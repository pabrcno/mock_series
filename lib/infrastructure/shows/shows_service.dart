import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_series/domain/shows/i_shows_service_facade.dart';
import 'package:mock_series/domain/shows/models/season.dart';
import 'package:mock_series/domain/shows/show_service_failure.dart';
import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/domain/shows/models/episode.dart';

@LazySingleton(as: IShowsServiceFacade)
class ShowsService implements IShowsServiceFacade {
  Dio dio = Dio();
  final String _apiUrl = "https://api.tvmaze.com/";
  @override
  Future<Either<ShowServiceFailure, List<Show>>> getShowsPage(
      {required int page}) async {
    String pageUri = '${_apiUrl}shows?page=$page';
    try {
      var response = await dio.get(pageUri);
      List<Show> showsList = [];
      response.data.forEach((json) => showsList.add(Show.fromJson(json)));
      return right(showsList);
    } on DioError catch (e) {
      return left(_handleError(e));
    }
  }

  @override
  Future<Either<ShowServiceFailure, List<Show>>> getShowsSearch(
      {required String search}) async {
    String pageUri = '${_apiUrl}search/shows?q=$search';
    try {
      var response = await dio.get(pageUri);
      List<Show> showsList = [];
      response.data
          .forEach((json) => showsList.add(Show.fromJson(json["show"])));

      return right(showsList);
    } on DioError catch (e) {
      return left(_handleError(e));
    }
  }

  @override
  Future<Either<ShowServiceFailure, List<Season>>> getShowSeasons(
      {required int showId}) async {
    String pageUri = '${_apiUrl}shows/$showId/seasons';
    try {
      var response = await dio.get(pageUri);
      List<Season> seasonsList = [];
      response.data.forEach((json) => seasonsList.add(Season.fromJson(json)));
      return right(seasonsList);
    } on DioError catch (e) {
      return left(_handleError(e));
    }
  }

  @override
  Future<Either<ShowServiceFailure, List<Episode>>> getShowSeasonEpisodes(
      {required int seasonId}) async {
    String pageUri = '${_apiUrl}seasons/$seasonId/episodes';
    try {
      var response = await dio.get(pageUri);
      List<Episode> episodesList = [];
      response.data.forEach((json) => episodesList.add(Episode.fromJson(json)));
      return right(episodesList);
    } on DioError catch (e) {
      return left(_handleError(e));
    }
  }

  ShowServiceFailure _handleError(DioError error) {
    if (error.response == null) {
      return const ShowServiceFailure.timeout();
    }
    int statusCode = error.response!.statusCode!;
    switch (statusCode) {
      case 401:
        return const ShowServiceFailure.unauthorized();
      case 404:
        return const ShowServiceFailure.notFound();
      case 408:
        return const ShowServiceFailure.timeout();
      case 429:
        return const ShowServiceFailure.rateLimit();
      case 500:
        return const ShowServiceFailure.serverError();
      default:
        return const ShowServiceFailure.unexpectedError();
    }
  }
}
