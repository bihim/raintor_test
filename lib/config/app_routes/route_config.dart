import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:raintor_test/config/app_routes/app_route.dart';
import 'package:raintor_test/features/event_feed/presentation/event_feed_screen/ui/event_feed_screen.dart';
import 'package:raintor_test/features/location/presentation/location_screen/ui/location_screen.dart';
import 'package:raintor_test/features/main/presentation/main_screen/ui/main_screen.dart';
import 'package:raintor_test/features/splash/presentation/splash_screen/ui/splash_screen.dart';

class RouteConfig {
  RouteConfig._();

  static final navigatorKey = GlobalKey<NavigatorState>();
  static final appRoute = GoRouter(
    initialLocation: AppRoute.splash,
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: AppRoute.splash,
        name: AppRoute.splash,
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          child: const SplashScreen(),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.location,
                name: AppRoute.location,
                pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  child: const LocationScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.eventFeed,
                name: AppRoute.eventFeed,
                pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  child: const EventFeedScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class FadeTransitionPage<T> extends CustomTransitionPage<T> {
  FadeTransitionPage({
    required super.child,
    super.key,
  }) : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
