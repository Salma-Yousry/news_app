

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Api/api_manager.dart';
import 'newsstate.dart';

class NewsWidgetViewModel extends Cubit<NewsState>{
  NewsWidgetViewModel ():super(NewsLoadingState());
//todo: hold data - handel logic
  void getNewsBySourceId(String sourceId)async {
    try{
      emit(NewsLoadingState());
      var responce = await ApiManager.getNewsBySourceId(sourceId);
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