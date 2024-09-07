import '../../../model/NewsResponce.dart';
//interface
abstract class NewsRemoteDataSource{
  Future<NewsResponce?>getNewsBySourceId(String sourceId);
}
abstract class NewsOfflineDataSource{}