import 'package:app_news/model/NewsResponce.dart';
import 'package:injectable/injectable.dart';

import '../news_data_source.dart';
import '../news_repository.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository{
  NewsRemoteDataSource remoteDataSource;
  NewsRepositoryImpl({required this.remoteDataSource}); //constructor injection
  @override
  Future<NewsResponce?> getNewsBySourceId(String sourceId) {
    return  remoteDataSource.getNewsBySourceId(sourceId);
  }
  
}