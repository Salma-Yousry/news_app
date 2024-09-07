

import 'package:app_news/repository/repositoty/news/repository/news_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../Api/api_manager.dart';
import '../../../repository/repositoty/news/dataSource/news_remore_data_source_impl.dart';
import '../../../repository/repositoty/news/news_data_source.dart';
import '../../../repository/repositoty/news/news_repository.dart';
import 'newsstate.dart';

@injectable
class NewsWidgetViewModel extends Cubit<NewsState>{
  NewsRepository newsRepository;
  NewsWidgetViewModel ({required this.newsRepository}):super(NewsLoadingState());
 /* late NewsRepository newsRepository;
  late NewsRemoteDataSource remoteDataSource;
  late ApiManager apiManager;
  NewsWidgetViewModel ():super(NewsLoadingState()){
    apiManager=ApiManager.getInstance();
    remoteDataSource = NewsRemoteDataSourceImpl(apiManager: apiManager);
    newsRepository = NewsRepositoryImpl(remoteDataSource: remoteDataSource);
  }*/
//todo: hold data - handel logic
  void getNewsBySourceId(String sourceId)async {
    try{
      emit(NewsLoadingState());
      var responce = await newsRepository.getNewsBySourceId(sourceId);
      if(responce?.status =='error'){
        emit(NewsErrorState(errorMessage: responce!.message!));
        return;
      }
      if(responce?.status == 'ok'){
        emit(NewsSuccessState(newsList:responce!.articles! ));
      }
    }catch(e){
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }

}