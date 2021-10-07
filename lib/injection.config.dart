// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/shows_controller/shows_controller.dart' as _i5;
import 'domain/shows/i_shows_service_facade.dart' as _i3;
import 'infrastructure/shows/shows_service.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IShowsServiceFacade>(() => _i4.ShowsService());
  gh.factory<_i5.ShowsController>(
      () => _i5.ShowsController(get<_i3.IShowsServiceFacade>()));
  return get;
}
