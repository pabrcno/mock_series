import 'package:freezed_annotation/freezed_annotation.dart';
part 'favorites_repository_failure.freezed.dart';

@freezed
abstract class FavoritesRepositoryFailure with _$FavoritesRepositoryFailure {
  const factory FavoritesRepositoryFailure.serverError() = ServerError;
  const factory FavoritesRepositoryFailure.unexpected() = Unexpected;
  const factory FavoritesRepositoryFailure.insufficientPermission() =
      InsufficientPermission;
  const factory FavoritesRepositoryFailure.unableToUpdate() = UnableToUpdate;
}
