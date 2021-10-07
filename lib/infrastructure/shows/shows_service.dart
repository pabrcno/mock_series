import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_series/domain/shows/i_shows_service_facade.dart';
import 'package:mock_series/domain/shows/show_service_failure.dart';
import 'package:mock_series/domain/shows/models/show.dart';
import 'package:mock_series/domain/shows/models/episode.dart';

@LazySingleton(as: IShowsServiceFacade)
class ShowsService implements IShowsServiceFacade {
  Dio dio = Dio();

  @override
  Future<Either<ShowServiceFailure, List<Show>>> getShowsPage(
      {required int page}) async {
    String pageUri = 'https://api.tvmaze.com/shows?page=$page';
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
  Future<Either<ShowServiceFailure, Show>> getShow({required int id}) {
    // TODO: implement getShow
    throw UnimplementedError();
  }

  @override
  Future<Either<ShowServiceFailure, List<Episode>>> getShowSeasonEpisodes(
      {required int seasonId}) {
    // TODO: implement getShowSeasonEpisodes
    throw UnimplementedError();
  }

  @override
  Future<Either<ShowServiceFailure, List<Episode>>> getShowSeasons(
      {required int showId}) {
    // TODO: implement getShowSeasons
    throw UnimplementedError();
  }

  @override
  Future<Either<ShowServiceFailure, List<Show>>> getShowsSearch(
      {required String search}) {
    // TODO: implement getShowsSearch
    throw UnimplementedError();
  }

  ShowServiceFailure _handleError(DioError error) {
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
