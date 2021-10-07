import 'package:dartz/dartz.dart';
import 'package:mock_series/domain/shows/models/season.dart';
import 'package:mock_series/domain/shows/show_service_failure.dart';

import 'models/episode.dart';
import 'models/show.dart';

abstract class IShowsServiceFacade {
  Future<Either<ShowServiceFailure, List<Show>>> getShowsPage(
      {required int page});
  Future<Either<ShowServiceFailure, List<Show>>> getShowsSearch(
      {required String search});
  Future<Either<ShowServiceFailure, Show>> getShow({required int id});
  Future<Either<ShowServiceFailure, List<Season>>> getShowSeasons(
      {required int showId});

  Future<Either<ShowServiceFailure, List<Episode>>> getShowSeasonEpisodes(
      {required int seasonId});
}
