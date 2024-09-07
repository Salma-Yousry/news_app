
import 'package:app_news/category/cubit/category_details_view_model.dart';
import 'package:app_news/category/cubit/sourcestate.dart';
import 'package:app_news/di/di.dart';
import 'package:app_news/di/di_impl.dart';
import 'package:app_news/model/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../appcolors.dart';
import '../home/tabs/tabs_widgets.dart';


class CategoryDetails extends StatefulWidget {
Category category;
CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = getIt<CategoryDetailsViewModel>(); ///field injection
//CategoryDetailsViewModel viewModel =
//CategoryDetailsViewModel(sourceRepositoryContract: injectSourceRepository());
  @override
void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSource(widget.category.id);
  }
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel,SourceState>(
      bloc: viewModel,
        builder: (context,state){
if(state is SourceLoadingState){
  return Center(child: CircularProgressIndicator(
    color: AppColors.primaryLightColor,
  ),);
}else if(state is SourceErrorState){
  return Column(
    children: [
      Text(state.errorMessage),
      ElevatedButton(onPressed: (){
viewModel.getSource(widget.category.id);
      }, child: Text('Try Again')),
    ],
  );
}else if (state is SourceSuccessState){
  return TabsWidgets(sourceList:state.sourceList );
}else{
  return Container();
}
  }
    );




      /* FutureBuilder <SourceResponse?> (
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
    ); */
  }
}
