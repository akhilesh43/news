# news_paper_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


#  project architecture
lib/
│
├── article_model.dart
├── bookmark_provider.dart
├── bookmark_screen.dart 
├── main.dart 
├── news_screen.dart
├── news_service.dart


# List of third-party packages

1. http
Purpose: To make HTTP requests to the NewsAPI.
 It's a simple and reliable package for REST API calls.
 NewsService class to fetch articles.
2. provider: State management.
 It allows efficient, reactive state updates without boilerplate. Used to manage bookmarks globally across the app.
 BookmarkProvider, Consumer<BookmarkProvider>.
3.intl: Date formatting.
 To format article publish dates (e.g., 25 May, 2025).
 formatDate(DateTime date) function in your UI.
4.shared_preferences
 To persist user data (e.g., bookmarked articles).
Allows saving small data locally (e.g., bookmarks) even after app restarts.
 Integrate this if you want bookmarks to be saved permanently
