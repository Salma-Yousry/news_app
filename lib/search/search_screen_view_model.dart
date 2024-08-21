import 'package:flutter/material.dart';
import 'package:app_news/Api/api_manager.dart';
import 'package:app_news/model/NewsResponce.dart';

class SearchViewModel extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  List<News> listNews = [];
  String? errorMessage;
  bool isLoading = false;

  void performSearch() async {
    errorMessage = null;
    isLoading = true;
    notifyListeners();

    String query = searchController.text.trim();
    if (query.isEmpty) {
      errorMessage = 'Please enter a search term';
      isLoading = false;
      notifyListeners();
      return;
    }

    try {
      NewsResponce? response = await ApiManager.searchNews(query);
      if (response != null && response.status == 'ok') {
        listNews = response.articles ?? [];
        if (listNews.isEmpty) {
          errorMessage = 'No results found.';
        }
      } else {
        errorMessage = 'No results found.';
      }
    } catch (e) {
      errorMessage = 'Error occurred: $e';
    }
    isLoading = false;
    notifyListeners();
  }
}

