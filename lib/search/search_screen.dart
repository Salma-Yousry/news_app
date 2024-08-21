import 'package:app_news/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'search_screen_view_model.dart';
import '../home/news/news_items.dart';

class SearchScreen extends StatelessWidget {
  SearchViewModel viewModel = SearchViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchViewModel>(
      create: (context) => viewModel,
      child: Consumer<SearchViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: TextField(
                controller: viewModel.searchController,
                decoration: InputDecoration(
                  hintText: 'Enter keywords or phrases...',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search,color: AppColors.whiteColor,),
                    onPressed: viewModel.performSearch,
                  ),
                ),
              ),
            ),
            body: viewModel.isLoading
                ? Center(child: CircularProgressIndicator())
                : viewModel.errorMessage != null
                ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(viewModel.errorMessage!),
                ElevatedButton(
                  onPressed: viewModel.performSearch,
                  child: Text('Try Again'),
                ),
              ],
            )
                : viewModel.listNews.isEmpty
                ? Center(child: Text('No results found.'))
                : ListView.builder(
              itemCount: viewModel.listNews.length,
              itemBuilder: (context, index) {
                return NewsItems(news: viewModel.listNews[index]);
              },
            ),
          );
        },
      ),
    );
  }
}






