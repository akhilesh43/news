import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:news_paper_app/aticle_model.dart';

class BookmarkProvider extends ChangeNotifier {
  List<Article> _bookmarks = [];

  List<Article> get bookmarks => _bookmarks;

  BookmarkProvider() {
    _loadBookmarks();
  }

  void toggleBookmark(Article article) {
    if (isBookmarked(article)) {
      _bookmarks.removeWhere((a) => a.url == article.url);
    } else {
      _bookmarks.add(article);
    }
    _saveBookmarks();
    notifyListeners();
  }

  bool isBookmarked(Article article) {
    return _bookmarks.any((a) => a.url == article.url);
  }

  void _saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> encodedBookmarks =
    _bookmarks.map((article) => json.encode(article.toJson())).toList();
    prefs.setStringList('bookmarks', encodedBookmarks);
  }

  void _loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? bookmarkStrings = prefs.getStringList('bookmarks');
    if (bookmarkStrings != null) {
      _bookmarks =
          bookmarkStrings.map((str) => Article.fromJson(json.decode(str))).toList();
      notifyListeners();
    }
  }
}

