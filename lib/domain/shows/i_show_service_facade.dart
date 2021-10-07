import 'package:dartz/dartz.dart';
import 'package:mock_series/domain/shows/show_service_failure.dart';

import 'models/episode.dart';
import 'models/show.dart';

abstract class IShowServiceFacade {
  Either<ShowServiceFailure, List<Show>> getShowsPage({required int page});
  Either<ShowServiceFailure, List<Show>> getShowsSearch(
      {required String search});
  Either<ShowServiceFailure, Show> getShow({required int id});
  Either<ShowServiceFailure, List<Episode>> getShowSeasons(
      {required int showId});
  Either<ShowServiceFailure, List<Episode>> getShowSeasonEpisodes(
      {required int seasonId});
}
