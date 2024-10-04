import 'package:animated_sidebar/providers/sidebar_provider.dart';
import 'package:animated_sidebar/ui/shared/widget/navbar.dart';
import 'package:animated_sidebar/ui/shared/widget/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LayoutPage extends ConsumerWidget {
  const LayoutPage({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final sidebarShow = ref.watch(sidebarShowMobileProvider);
    return Scaffold(
      body: Row(
        children: [
          if (size.width > 600) const SideBar(),
          Flexible(
            child: Stack(
              children: [
                Column(
                  children: [
                    const Navbar(),
                    Expanded(
                      child: child,
                    ),
                  ],
                ),
                // sidebar mobile con animación
                if (size.width < 600)
                  Stack(
                    children: [
                      if (sidebarShow)
                        GestureDetector(
                          onTap: () {
                            ref.read(sidebarShowMobileProvider.notifier).state =
                                false;
                          },
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade800.withOpacity(0.25),
                            ),
                          ),
                        ),
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(
                          begin: sidebarShow ? -size.width : 0,
                          end: sidebarShow ? 0 : -size.width,
                        ),
                        duration: const Duration(milliseconds: 400),
                        curve: sidebarShow ? Curves.easeOut : Curves.easeIn,
                        builder: (context, value, child) {
                          return Positioned(
                            left: value,
                            top: 0,
                            bottom: 0,
                            width: size.width * 0.75,
                            child: const SideBar(),
                          );
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
