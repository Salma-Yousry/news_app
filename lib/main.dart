import 'package:app_news/home/home_screen.dart';
import 'package:app_news/my_theme_data.dart';
import 'package:app_news/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'my_bloc_observer.dart';

void main(){
  Bloc.observer = MyBlocObserver();
  runApp(ChangeNotifierProvider(
      create:(context) => AppConfigProvider() ,
      child: MyApp()));
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider  = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.LightTheme,
      initialRoute: HomeScreen.route_name ,
      routes:{
        HomeScreen.route_name : (context)=>HomeScreen(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }
}
