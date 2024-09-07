
import 'package:app_news/di/di.dart';
import 'package:app_news/di/di_impl.dart';
import 'package:app_news/home/news/cubit/news_widght_view_model.dart';
import 'package:app_news/home/news/cubit/newsstate.dart';
import 'package:app_news/home/news/news_items.dart';
import 'package:app_news/model/SourceResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../appcolors.dart';


class NewsWidght extends StatefulWidget {
Source source;
NewsWidght({required this.source});

  @override
  State<NewsWidght> createState() => _NewsWidghtState();
}

class _NewsWidghtState extends State<NewsWidght> {
  NewsWidgetViewModel viewModel = getIt<NewsWidgetViewModel>();
 // NewsWidgetViewModel viewModel = NewsWidgetViewModel(newsRepository: injectNewsRepository());
@override
void initState() {
  // TODO: implement initState
  super.initState();
  viewModel.getNewsBySourceId(widget.source.id??'');
}
  Widget build(BuildContext context) {
  //BlocConsumer in session 17

    return BlocBuilder<NewsWidgetViewModel, NewsState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return Center(child: CircularProgressIndicator(
              color: AppColors.primaryLightColor,
            ),);
          } else if (state is NewsErrorState) {
           return Column(
              children: [
                Text(state.errorMessage),
                ElevatedButton(onPressed: () {
                  viewModel.getNewsBySourceId(widget.source.id ?? '');
                }, child: Text('Try Again')),
              ],
            );
          } else if (state is NewsSuccessState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsItems(news: state.newsList[index]);
              },
              itemCount: state.newsList.length
            );
          }else{
            return Container();
          }
        }
    );


      /*FutureBuilder<NewsResponce?>(
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
    );*/

  }
}
