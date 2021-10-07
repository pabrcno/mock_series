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
      print(response);
    } on DioError catch (e) {
      print(e.type);
    }
    throw UnimplementedError();
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
}
