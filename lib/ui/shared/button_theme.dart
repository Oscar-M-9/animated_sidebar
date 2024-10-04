import 'package:animated_sidebar/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeButton extends ConsumerWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifier) == ThemeMode.dark;

    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              ref.read(themeNotifier.notifier).toggleTheme();
            },
            tooltip: "Cambiar tema",
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: isDarkMode
                  ? const Icon(CupertinoIcons.moon_stars)
                  : const Icon(CupertinoIcons.sun_max),
            ),
          ),
        ],
      ),
    );
  }
}
