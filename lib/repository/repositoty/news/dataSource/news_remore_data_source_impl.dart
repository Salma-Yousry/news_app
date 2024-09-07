import 'package:app_news/model/NewsResponce.dart';
import 'package:injectable/injectable.dart';

import '../../../../Api/api_manager.dart';

import '../news_data_source.dart';
@Injectable(as:NewsRemoteDataSource )
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  @override
  ApiManager apiManager;

  NewsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<NewsResponce?> getNewsBySourceId(String sourceId) async {
    var response = await apiManager.getNewsBySourceId(sourceId);
    return response;
  }
}





