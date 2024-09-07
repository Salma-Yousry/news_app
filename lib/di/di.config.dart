// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../Api/api_manager.dart' as _i3;
import '../category/cubit/category_details_view_model.dart' as _i14;
import '../home/news/cubit/news_widght_view_model.dart' as _i8;
import '../repository/repositoty/news/dataSource/news_remore_data_source_impl.dart'
    as _i5;
import '../repository/repositoty/news/news_data_source.dart' as _i4;
import '../repository/repositoty/news/news_repository.dart' as _i6;
import '../repository/repositoty/news/repository/news_repository_impl.dart'
    as _i7;
import '../repository/repositoty/sources/dataSource/source_offline_data_source_imp.dart'
    as _i10;
import '../repository/repositoty/sources/dataSource/source_remote_data_source_impl.dart'
    as _i11;
import '../repository/repositoty/sources/repository/source_repository_impl.dart'
    as _i13;
import '../repository/repositoty/sources/source_data_source.dart' as _i9;
import '../repository/repositoty/sources/source_repository_contract.dart'
    as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.NewsRemoteDataSource>(
        () => _i5.NewsRemoteDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i6.NewsRepository>(() => _i7.NewsRepositoryImpl(
        remoteDataSource: gh<_i4.NewsRemoteDataSource>()));
    gh.factory<_i8.NewsWidgetViewModel>(() =>
        _i8.NewsWidgetViewModel(newsRepository: gh<_i6.NewsRepository>()));
    gh.factory<_i9.SourceOfflineDataSource>(
        () => _i10.SourceOfflineDataSourceImpl());
    gh.factory<_i9.SourceRemoteDataSource>(() =>
        _i11.SourceRemoteDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i12.SourceRepositoryContract>(() => _i13.SourceRepositoryImpl(
          remoteDataSource: gh<_i9.SourceRemoteDataSource>(),
          sourceOfflineDataSource: gh<_i9.SourceOfflineDataSource>(),
        ));
    gh.factory<_i14.CategoryDetailsViewModel>(() =>
        _i14.CategoryDetailsViewModel(
            sourceRepositoryContract: gh<_i12.SourceRepositoryContract>()));
    return this;
  }
}
