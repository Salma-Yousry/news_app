import 'package:app_news/appcolors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/NewsResponce.dart';

class NewsItems extends StatelessWidget {
News news;
NewsItems({required this.news});
  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child:CachedNetworkImage(
              imageUrl: news.urlToImage??'',
              height: MediaQuery.of(context).size.height*.3,
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryLightColor,
                  )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),

         /* Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Image.network(news.urlToImage??''),
          )*/

          SizedBox(height: 10,),
      Text(news.author??'',style: Theme.of(context).textTheme.titleSmall?.copyWith(
        color: AppColors.grayColor,
      ),),
          SizedBox(height: 10,),
          Text(news.title??'',style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 10,),
          Text(news.publishedAt??'',
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: AppColors.grayColor,

          ),)

        ],
      )
    );
  }
}
