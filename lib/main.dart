import 'package:animated_sidebar/providers/theme_provider.dart';
import 'package:animated_sidebar/router/router.dart';
import 'package:animated_sidebar/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeNotifier);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Animated Sidebar',
      themeMode: theme,
      theme: AppTheme.themeLight,
      darkTheme: AppTheme.themeDark,
      routerConfig: AppRouter.router,
    );
  }
}
