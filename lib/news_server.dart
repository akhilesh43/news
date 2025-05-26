import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_paper_app/aticle_model.dart';


class NewsService {
  final String apiKey = 'cf26e64cc0e94149bcd958c3ba43d20e';
  final String url = 'https://newsapi.org/v2/top-headlines?country=us';

  Future<List<Article>> fetchArticles() async {
    final response = await http.get(Uri.parse('$url&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final List articlesJson = jsonDecode(response.body)['articles'];
      return articlesJson.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
