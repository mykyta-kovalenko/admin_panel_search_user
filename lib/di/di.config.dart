// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:admin_panel_user_search/cubit/search_cubit/search_cubit.dart'
    as _i5;
import 'package:admin_panel_user_search/mocks/dummy_data.dart' as _i3;
import 'package:admin_panel_user_search/service/user_service.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.DummyData>(() => _i3.DummyData());
  gh.factory<_i4.UserService>(() => _i4.UserService(gh<_i3.DummyData>()));
  gh.factory<_i5.SearchCubit>(() => _i5.SearchCubit(gh<_i4.UserService>()));
  return getIt;
}
