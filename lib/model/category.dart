import 'dart:ui';

import 'package:app_news/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Category{
  String id;
  String title;
  String imagepath;
  Color color;

  Category({required this.title,required this.id,
    required this.color ,required this.imagepath});
/*
business entertainment general health science sports technology
 */
  static List<Category> getCategories(BuildContext context){
return[
  Category(title:  AppLocalizations.of(context)!.business, id: 'business', color: AppColors.brownColor, imagepath: 'assets/images/bussines.png'),
  Category(title: AppLocalizations.of(context)!.entertainment, id: 'entertainment', color: AppColors.blueColor, imagepath: 'assets/images/environment.png'),
  Category(title: AppLocalizations.of(context)!.general, id: 'general', color: AppColors.darkBlueColor, imagepath: 'assets/images/Politics.png'),
  Category(title: AppLocalizations.of(context)!.health, id: 'health', color: AppColors.pinkColor, imagepath: 'assets/images/health.png'),
  Category(title: AppLocalizations.of(context)!.science, id: 'science', color: AppColors.yellowColor, imagepath: 'assets/images/science.png'),
  Category(title: AppLocalizations.of(context)!.sports, id: 'sports', color: AppColors.redColor, imagepath: 'assets/images/sports.png'),

];
}

}