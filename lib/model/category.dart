import 'dart:ui';

import 'package:app_news/appcolors.dart';

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
  static List<Category> getCategories(){
return[
  Category(title: 'Business', id: 'business', color: AppColors.brownColor, imagepath: 'assets/images/bussines.png'),
  Category(title: 'entertainment', id: 'Entertainment', color: AppColors.blueColor, imagepath: 'assets/images/environment.png'),
  Category(title: 'General', id: 'general', color: AppColors.darkBlueColor, imagepath: 'assets/images/Politics.png'),
  Category(title: 'Health', id: 'health', color: AppColors.pinkColor, imagepath: 'assets/images/health.png'),
  Category(title: 'Science', id: 'science', color: AppColors.yellowColor, imagepath: 'assets/images/science.png'),
  Category(title: 'Sports', id: 'sports', color: AppColors.redColor, imagepath: 'assets/images/sports.png'),

];
}

}