// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/shows_controller/shows_controller.dart' as _i7;
import 'domain/favorites_repository/i_favorites_repository_facade.dart' as _i3;
import 'domain/shows/i_shows_service_facade.dart' as _i5;
import 'infrastructure/favorites_repository/favorites_respository.dart' as _i4;
import 'infrastructure/shows/shows_service.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IFavoritesRepositoryFacade>(
      () => _i4.FavoritesRepository());
  gh.lazySingleton<_i5.IShowsServiceFacade>(() => _i6.ShowsService());
  gh.factory<_i7.ShowsController>(
      () => _i7.ShowsController(get<_i5.IShowsServiceFacade>()));
  return get;
}
