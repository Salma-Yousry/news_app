import 'package:app_news/model/SourceResponse.dart';
import 'package:injectable/injectable.dart';
//interface

abstract class SourceRepositoryContract{
 Future<SourceResponse?>getSource(String categoryId);
}