
import 'package:flutter/material.dart';
import 'package:news_paper_app/Book_mark_provider.dart';

import 'package:news_paper_app/Splash_Screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
      ChangeNotifierProvider(
      create: (_) => BookmarkProvider(),
        child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}
