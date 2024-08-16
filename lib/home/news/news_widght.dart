import 'package:app_news/Api/api_manager.dart';
import 'package:app_news/home/news/news_items.dart';
import 'package:app_news/model/NewsResponce.dart';
import 'package:app_news/model/SourceResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../appcolors.dart';

class NewsWidght extends StatefulWidget {
Source source;
NewsWidght({required this.source});

  @override
  State<NewsWidght> createState() => _NewsWidghtState();
}

class _NewsWidghtState extends State<NewsWidght> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponce?>(
        future: ApiManager.getNewsBySourceId(widget.source.id??''),
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
                  ApiManager.getNewsBySourceId(widget.source.id??'');
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
                  ApiManager.getNewsBySourceId(widget.source.id??'');
                }, child: Text('Try Again'))
              ],
            );
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(
              itemBuilder:(context,index){
                return NewsItems(news:newsList[index]);
              },
              itemCount: newsList.length,

              );
        }
    );

  }
}
