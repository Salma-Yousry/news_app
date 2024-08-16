import 'package:app_news/model/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
Category category;
int index;
CategoryItem({required this.category,required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(index % 2 == 0? 0 : 25),
          bottomLeft: Radius.circular(index % 2 != 0? 0 : 25),
        ),
      ),
      child: Column(
        children: [
          Image.asset(category.imagepath,
          height: MediaQuery.of(context).size.height*.15,),
          Text(category.title,style: Theme.of(context).textTheme.titleLarge,),
        ],
      ),

    );
  }
}
