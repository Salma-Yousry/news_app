import 'package:app_news/category/category_item.dart';
import 'package:app_news/model/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryFragment extends StatelessWidget {
 var categoryList = Category.getCategories();
Function onCategoryItemClick;
CategoryFragment({required this.onCategoryItemClick});
  @override
  Widget build(BuildContext context) {
    return Container(
margin: EdgeInsets.all(25),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pick your category \n of interest',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 27,
            ),),
          SizedBox(height: 20,),
          Expanded(

            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing:10,
               mainAxisSpacing:10 ,
              ),

              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
onCategoryItemClick(categoryList[index]);
                  },
                    child: CategoryItem(index:index ,category:categoryList[index] ,));
              },
            itemCount: categoryList.length,),
          ),

        ],
      ),
    );
  }
}
