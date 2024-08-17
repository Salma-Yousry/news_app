import 'package:app_news/category/category_details_view_model.dart';
import 'package:app_news/model/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Api/api_manager.dart';
import '../appcolors.dart';
import '../home/tabs/tabs_widgets.dart';


class CategoryDetails extends StatefulWidget {
Category category;
CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      //Consumer listen to view model
      child: Consumer <CategoryDetailsViewModel>(
        //builder return widget
        builder:((context,viewModel,child){
          if(viewModel.errorMassage != null){
            return   Column(
              children: [
                Text(viewModel.errorMassage!),
                ElevatedButton(onPressed: (){
                  viewModel.getSources(widget.category.id);
                  }
          ,child: Text('Try Again')),

              ],
            );
          }
else if(viewModel.sourceList == null){
  return Center(child: CircularProgressIndicator(
      color: AppColors.primaryLightColor,
  ),
  );
}else{
  return TabsWidgets(sourceList:viewModel.sourceList! );
}
        }),
      ),
    );

 /*FutureBuilder <SourceResponse?> (
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
                   setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );
          }
          var sourceList = snapshot.data!.sources!;
          return TabsWidgets(sourceList:sourceList );
        }
    );*/
  }
}
