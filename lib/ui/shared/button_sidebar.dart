import 'package:animated_sidebar/providers/sidebar_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonSidebar extends ConsumerWidget {
  const ButtonSidebar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        ref.read(sidebarShowMobileProvider.notifier).state = true;
      },
      icon: const Icon(CupertinoIcons.sidebar_left),
    );
  }
}
