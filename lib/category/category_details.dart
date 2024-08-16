import 'package:app_news/model/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Api/api_manager.dart';
import '../appcolors.dart';
import '../home/tabs/tabs_widgets.dart';
import '../model/SourceResponse.dart';

class CategoryDetails extends StatefulWidget {
Category category;
CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder <SourceResponse?> (
        future: ApiManager.getSources(widget.category.id),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(
              color: AppColors.primaryLightColor,
            ),);

          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.getSources(widget.category.id);
                  setState(() {

                  });
                }, child: Text('Try Again')),
              ],
            );
          }
          //server => success ,error
          if(snapshot.data!.status != 'ok'){
            Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){
                  ApiManager.getSources(widget.category.id);
                }, child: Text('Try Again'))
              ],
            );
          }
          var sourceList = snapshot.data!.sources!;
          return TabsWidgets(sourceList:sourceList );
        }
    );
  }
}
