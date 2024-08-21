import 'package:app_news/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;
Function onSideMenuItemClick;
HomeDrawer({required this.onSideMenuItemClick});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(

          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height*.08,
          ),
width: double.infinity,
          //height:MediaQuery.of(context).size.height*.2 ,
          color: AppColors.primaryLightColor,
          child: Center(
            child: Text(AppLocalizations.of(context)!.news_app
              ,style: Theme.of(context).textTheme.titleLarge,),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: (){
onSideMenuItemClick(categories);
            },
            child: Row(
              children: [
                Icon(Icons.list,size: 35,color: AppColors.blackColor,),
                SizedBox(width: 10,),
                Text(AppLocalizations.of(context)!.categories,style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 27,
                ),)
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: (){
onSideMenuItemClick(settings);
            },

            child: Row(
              children: [
                Icon(Icons.settings,size: 35,color: AppColors.blackColor,),
                SizedBox(width: 10,),
                Text(AppLocalizations.of(context)!.settings,style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 27,
                ),)
              ],
            ),
          ),
        )
      ],
    );
  }
}
