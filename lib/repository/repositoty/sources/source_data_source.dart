import '../../../model/SourceResponse.dart';
//interface

abstract class SourceRemoteDataSource{
  Future<SourceResponse?>getSource(String categoryId);
}
abstract class SourceOfflineDataSource{
  Future<SourceResponse?>getSource(String categoryId);
  void saveSources(SourceResponse?sourceResponse,String category);
}
abstract class SourceCachingDataSource{}
