import 'package:app_news/Api/api_manager.dart';
import 'package:app_news/model/SourceResponse.dart';
import 'package:app_news/repository/repositoty/sources/source_data_source.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: SourceRemoteDataSource)
class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  ApiManager apiManager ;
  SourceRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<SourceResponse?> getSource(String categoryId) async {
    var response = await apiManager.getSources(categoryId);
    return response;
  }

}