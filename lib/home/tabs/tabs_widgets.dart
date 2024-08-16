import 'package:app_news/home/news/news_widght.dart';
import 'package:app_news/home/tabs/tab_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/SourceResponse.dart';

class TabsWidgets extends StatefulWidget {
List<Source>sourceList;

TabsWidgets({required this.sourceList});

  @override
  State<TabsWidgets> createState() => _TabsWidgetsState();
}

class _TabsWidgetsState extends State<TabsWidgets> {
int selectedindex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
       length: widget.sourceList.length,

        child: Column(
    children: [
      TabBar(
        onTap: (index){
          selectedindex=index;
          setState(() {

          });
        },
          isScrollable: true,
          indicatorColor: Colors.transparent,
          tabs: widget.sourceList.map((source)=>
          TabItems(source: source,
              isSelected: selectedindex == widget.sourceList.indexOf(source),
          )).toList(),),
      Expanded(child: NewsWidght(source: widget.sourceList[selectedindex]))
    ],
    )
    );
  }
}
