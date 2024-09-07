import 'package:app_news/Api/api_manager.dart';
import 'package:app_news/category/cubit/sourcestate.dart';
import 'package:app_news/repository/repositoty/sources/dataSource/source_offline_data_source_imp.dart';
import 'package:app_news/repository/repositoty/sources/dataSource/source_remote_data_source_impl.dart';
import 'package:app_news/repository/repositoty/sources/repository/source_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../repository/repositoty/sources/source_data_source.dart';
import '../../repository/repositoty/sources/source_repository_contract.dart';
@injectable
class CategoryDetailsViewModel extends Cubit<SourceState>{
  SourceRepositoryContract sourceRepositoryContract;
  CategoryDetailsViewModel ({required this.sourceRepositoryContract}):super(SourceLoadingState());

  /* late SourceRepositoryContract sourceRepositoryContract;
  late SourceRemoteDataSource sourceRemoteDataSource;
  late SourceOfflineDataSource OfflineDataSource;
  late ApiManager apiManager;

  CategoryDetailsViewModel ():super(SourceLoadingState()){
    apiManager=ApiManager.getInstance();
    sourceRemoteDataSource = SourceRemoteDataSourceImpl(apiManager: apiManager);
    OfflineDataSource = SourceOfflineDataSourceImpl();
    sourceRepositoryContract = SourceRepositoryImpl(remoteDataSource: sourceRemoteDataSource,
        sourceOfflineDataSource: OfflineDataSource
    );
  }*/


//todo: hold data - handel logic
void getSource(String categoryId)async {
  try{
    emit(SourceLoadingState());
var responce = await sourceRepositoryContract.getSource(categoryId);
if(responce?.status =='error'){
emit(SourceErrorState(errorMessage: responce!.message!));
return;
}
if(responce?.status == 'ok'){
emit(SourceSuccessState(sourceList:responce!.sources! ));
}
  }catch(e){
    emit(SourceErrorState(errorMessage: e.toString()));
  }
}

}