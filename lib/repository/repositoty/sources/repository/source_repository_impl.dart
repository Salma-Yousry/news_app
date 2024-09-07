import 'package:app_news/model/SourceResponse.dart';
import 'package:app_news/repository/repositoty/sources/source_data_source.dart';
import 'package:app_news/repository/repositoty/sources/source_repository_contract.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SourceRepositoryContract)
class SourceRepositoryImpl implements SourceRepositoryContract{
  SourceRemoteDataSource remoteDataSource;
  SourceOfflineDataSource sourceOfflineDataSource;
  SourceRepositoryImpl({required this.remoteDataSource,required this.sourceOfflineDataSource});
  @override

  Future<SourceResponse?> getSource(String categoryId) async {
   //todo : internet => remote
var checkResult = await Connectivity().checkConnectivity();
if(checkResult == ConnectivityResult.wifi || checkResult == ConnectivityResult.mobile){
  var sourceResponse = await remoteDataSource.getSource(categoryId);
  sourceOfflineDataSource.saveSources(sourceResponse,categoryId);
  return sourceResponse;
}else {
  //todo: no internet=> offline
var sourceResponse = await sourceOfflineDataSource.getSource(categoryId);
return sourceResponse;

}

  }
  
}