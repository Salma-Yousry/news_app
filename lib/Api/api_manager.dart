import 'dart:convert';
import 'package:app_news/Api/api_constants.dart';
import 'package:app_news/model/NewsResponce.dart';
import 'package:app_news/model/SourceResponse.dart';
import 'package:http/http.dart' as http;
class ApiManager{
/*
 https://newsapi.org/v2/top-headlines/sources?apiKey=de9da81625e748db9bc3454e507eb382
 */
static Future <SourceResponse?> getSources(String categoryId)async{
  Uri url= Uri.https(ApiConastants.baseUrl,ApiConastants.sourceAPI,

  {
    'apiKey': 'de9da81625e748db9bc3454e507eb382',
    'category' : categoryId
  });
  var response = await http.get(url);
  try{
    var responseBody = response.body; //string
    var json = jsonDecode(responseBody); //json
    return SourceResponse.fromJson(json);    //object

    ///بديل ال 3 سطور
    //SourceResponse.fromJson(jsonDecode(response.body));
  }catch(e){
    throw e;
  }


}
/*
https://newsapi.org/v2/everything?q=bitcoin&apiKey=de9da81625e748db9bc3454e507eb382
 */
static Future<NewsResponce?> getNewsBySourceId(String sourceId) async {
  Uri url = Uri.https(ApiConastants.baseUrl,ApiConastants.newsAPI,{
    'apiKey':'de9da81625e748db9bc3454e507eb382',
    'sources':sourceId
  });
var response = await http.get(url);
try{
  return NewsResponce.fromJson(jsonDecode(response.body));

}catch(e){
  throw e;
}

}

}