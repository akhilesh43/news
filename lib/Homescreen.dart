
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_paper_app/Book_mark_provider.dart';

import 'package:news_paper_app/aticle_model.dart';
import 'package:news_paper_app/login_Page.dart';
import 'package:news_paper_app/login_helper.dart';
import 'package:news_paper_app/news_server.dart';
import 'package:news_paper_app/Bookmark_screen.dart';
import 'package:news_paper_app/web_view.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  final NewsService newsService = NewsService();

  String formatDate(DateTime date) {
    return DateFormat('d MMMM, y').format(date); // e.g., 16 April, 2025
  }
  void _signOut(BuildContext context) async {
    await Helper.clearLogin();
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Latest News')),
      body: FutureBuilder<List<Article>>(
        future: newsService.fetchArticles(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                final isBookmarked = context.watch<BookmarkProvider>().isBookmarked(article);
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    leading: article.urlToImage != ''
                        ? Image.network(article.urlToImage, width: 100, fit: BoxFit.cover)
                        : SizedBox(width: 100),
                    title: Text(article.title, maxLines: 2, overflow: TextOverflow.ellipsis),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(article.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                        Text('${article.source} • ${formatDate(article.publishedAt)}', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        color: isBookmarked ? Colors.blue : null,
                      ),
                      onPressed: () {
                        context.read<BookmarkProvider>().toggleBookmark(article);
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => WebViewScreen(url: article.url)),
                      );
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading news'));
          }
          return Center(child: CircularProgressIndicator());
        },

      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Latest News App', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Bookmarks'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BookmarkScreen()));
                 // already implemented
              },
            ),

            ListTile(
              leading: Icon(Icons.signpost_outlined),
              title: Text('Sign Out'),
              onTap: () {
                _signOut(context);
                // Navigate to a settings screen if implemented
              },
            ),
          ],
        ),
      ),

    );
  }
}