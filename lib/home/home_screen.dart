import 'package:app_news/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../appcolors.dart';
import '../category/category_details.dart';
import '../category/category_fragment.dart';
import '../drawer/home_drawer.dart';
import '../model/category.dart';

class HomeScreen extends StatefulWidget {

static const String route_name = 'Home_Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
     children: [
      Container(
       color: AppColors.whiteColor,
       child: Image.asset('assets/images/background.png',
       width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    ),
  ),
  Scaffold(
backgroundColor: Colors.transparent,
    appBar: AppBar(
      title: Text(
        selectMenuItem == HomeDrawer.settings?
            'Settings'
            :
            selectedCategary==null?
        'News App': selectedCategary!.title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    ),
    drawer: Drawer(
      child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick,),
    ),
    body: selectMenuItem == HomeDrawer.settings?
        SettingsTab()
        :

       selectedCategary == null
        ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
        : CategoryDetails(category: selectedCategary!),
  ),
],
    );
  }
  Category? selectedCategary;

  void onCategoryItemClick (Category newCategory){
//todo: newCategory => user select
  selectedCategary = newCategory;
  setState(() {

  });
  }
  int selectMenuItem = HomeDrawer.categories;
  void onSideMenuItemClick (int newSideItem){
//todo: onSideMenuItemClick => user select
  selectMenuItem = newSideItem;
  selectedCategary=null;
  Navigator.pop(context);
  setState(() {

  });
  }
}
