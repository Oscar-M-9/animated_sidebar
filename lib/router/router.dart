import 'package:animated_sidebar/ui/pages/layout/layout_page.dart';
import 'package:animated_sidebar/ui/view/content_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/dashboard',
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return LayoutPage(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) => _buildPageWithFadeTransition(
              context,
              state,
              const ContentView(text: "Dashboard view"),
            ),
          ),
          GoRoute(
            path: '/products',
            pageBuilder: (context, state) => _buildPageWithFadeTransition(
              context,
              state,
              const ContentView(text: "Products view"),
            ),
          ),
          GoRoute(
            path: '/calendar',
            pageBuilder: (context, state) => _buildPageWithFadeTransition(
              context,
              state,
              const ContentView(text: "Calendar view"),
            ),
          ),
          GoRoute(
            path: '/suppliers',
            pageBuilder: (context, state) => _buildPageWithFadeTransition(
              context,
              state,
              const ContentView(text: "Suppliers view"),
            ),
          ),
          GoRoute(
            path: '/reports',
            pageBuilder: (context, state) => _buildPageWithFadeTransition(
              context,
              state,
              const ContentView(text: "Reports view"),
            ),
          ),
          GoRoute(
            path: '/notifications',
            pageBuilder: (context, state) => _buildPageWithFadeTransition(
              context,
              state,
              const ContentView(text: "Notifications view"),
            ),
          ),
          GoRoute(
            path: '/settings',
            pageBuilder: (context, state) => _buildPageWithFadeTransition(
              context,
              state,
              const ContentView(text: "Settings view"),
            ),
          ),
          GoRoute(
            path: '/support',
            pageBuilder: (context, state) => _buildPageWithFadeTransition(
              context,
              state,
              const ContentView(text: "Support view"),
            ),
          ),
        ],
      ),
    ],
  );

  static CustomTransitionPage _buildPageWithFadeTransition(
    BuildContext context,
    GoRouterState state,
    Widget child,
  ) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
