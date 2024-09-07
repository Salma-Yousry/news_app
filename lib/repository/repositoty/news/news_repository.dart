//interface
import '../../../model/NewsResponce.dart';

abstract class NewsRepository{
  Future<NewsResponce?>getNewsBySourceId(String sourceId);
}