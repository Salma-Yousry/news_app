import 'package:app_news/model/SourceResponse.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../source_data_source.dart';
@Injectable(as: SourceOfflineDataSource)
class SourceOfflineDataSourceImpl implements SourceOfflineDataSource{
  @override
  Future<SourceResponse?> getSource(String categoryId)async{
    // TODO: implement getSource
    var box = await Hive.openBox('tabs');
   var data = SourceResponse.fromJson( box.get(categoryId)); ///map=>object
   return data;
  }

  @override
  void saveSources(SourceResponse? sourceResponse,String category) async {
    // TODO: implement saveSources
    var box = await Hive.openBox('tabs');
    await box.put(category, sourceResponse?.toJson()); ///map
    await box.close();
  }

}