import 'package:flutter/material.dart';
import 'package:news_paper_app/Book_mark_provider.dart';
import 'package:news_paper_app/Homescreen.dart';
import 'package:news_paper_app/web_view.dart';
import 'package:provider/provider.dart';


class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookmarkProvider>(
      builder: (context, bookmarkProvider, child) {
        final bookmarks = bookmarkProvider.bookmarks;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Bookmarked '),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          ),
          body: bookmarks.isEmpty
              ? const Center(child: Text('No bookmarks yet.'))
              : ListView.builder(
            itemCount: bookmarks.length,
            itemBuilder: (context, index) {
              final article = bookmarks[index];
              return ListTile(
                leading: article.urlToImage.isNotEmpty
                    ? Image.network(article.urlToImage,
                    width: 100, fit: BoxFit.cover)
                    : const SizedBox(width: 100),
                title: Text(article.title),
                subtitle: Text(
                  article.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    bookmarkProvider.toggleBookmark(article);
                  },
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WebViewScreen(url: article.url),
                      )
                  );
                }


              );
            }

        ),
    );
      },
    );
  }
}
