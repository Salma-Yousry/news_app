import 'package:app_news/Api/api_manager.dart';
import 'package:app_news/category/cubit/sourcestate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailsViewModel extends Cubit<SourceState>{
CategoryDetailsViewModel ():super(SourceLoadingState());
//todo: hold data - handel logic
void getSource(String categoryId)async {
  try{
    emit(SourceLoadingState());
var responce = await ApiManager.getSources(categoryId);
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