import 'package:flutter/material.dart';
import 'package:movies_app/presentation/journeys/home/home_screen.dart';
import 'package:movies_app/presentation/journeys/movie_details/movie_details_screen.dart';
import 'package:movies_app/presentation/journeys/movie_favorite/favorite_screen.dart';
import 'package:movies_app/presentation/journeys/movie_videos/movie_videos_screen.dart';

import 'fade_page_route_builder.dart';

class AppRouter {
  const AppRouter._();

  static const String initial = '/';
  static const String details = '/details';
  static const String videos = '/videos';
  static const String favorites = '/favorites';

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case details:
        final movieId = (settings.arguments ?? 0) as int;
        return FadePageRouteBuilder(
          builder: (context) => MovieDetailsScreen(movieId: movieId),
          settings: settings,
        );
      case videos:
        final movieId = settings.arguments as int;
        return FadePageRouteBuilder(
          builder: (context) => MovieVideosScreen(movieId: movieId),
          settings: settings,
        );
      case favorites:
        return FadePageRouteBuilder(
          builder: (context) => const FavoriteScreen(),
          settings: settings,
        );
      default:
        return FadePageRouteBuilder(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );
    }
  }
}
