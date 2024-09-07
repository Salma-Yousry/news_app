//todo: viewModel => object Repository
//todo:  Repository => object datasource
//todo: datasource => object apiManager


import 'package:app_news/repository/repositoty/news/dataSource/news_remore_data_source_impl.dart';
import 'package:app_news/repository/repositoty/news/news_data_source.dart';
import 'package:app_news/repository/repositoty/news/news_repository.dart';
import 'package:app_news/repository/repositoty/news/repository/news_repository_impl.dart';
import 'package:app_news/repository/repositoty/sources/dataSource/source_offline_data_source_imp.dart';
import 'package:app_news/repository/repositoty/sources/dataSource/source_remote_data_source_impl.dart';
import 'package:app_news/repository/repositoty/sources/repository/source_repository_impl.dart';
import 'package:app_news/repository/repositoty/sources/source_data_source.dart';
import 'package:app_news/repository/repositoty/sources/source_repository_contract.dart';
import '../Api/api_manager.dart';
/*
SourceRepositoryContract injectSourceRepository(){
return SourceRepositoryImpl(remoteDataSource: injectSourceRemoteDataSource(),
    sourceOfflineDataSource: injectSourceOfflineDataSource());
}
SourceRemoteDataSource injectSourceRemoteDataSource(){
  return SourceRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
SourceOfflineDataSource injectSourceOfflineDataSource(){
  return SourceOfflineDataSourceImpl();
}
NewsRepository injectNewsRepository(){
  return NewsRepositoryImpl(remoteDataSource: injectNewsRemoteDataSource());
}
NewsRemoteDataSource injectNewsRemoteDataSource(){
  return NewsRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}*/