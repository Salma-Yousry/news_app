import 'package:app_news/Api/api_manager.dart';
import 'package:app_news/model/SourceResponse.dart';
import 'package:flutter/material.dart';


class CategoryDetailsViewModel extends ChangeNotifier{
//hold data - handel logic

List<Source>? sourceList;
String? errorMassage;

void getSources(String categoryId)async{
  sourceList = null;
  errorMassage = null;
  notifyListeners();
  try {
    var response = await ApiManager.getSources(categoryId);
    if(response?.status == 'error'){
errorMassage = response!.message;
    }else{
      sourceList = response!.sources;
    }
  }catch(e){
errorMassage = 'error loading source list.';
  }
  notifyListeners();
}

}