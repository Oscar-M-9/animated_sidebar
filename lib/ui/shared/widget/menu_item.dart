import 'package:animated_sidebar/providers/sidebar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MenuItem extends ConsumerStatefulWidget {
  const MenuItem({
    super.key,
    required this.percentage,
    required this.icon,
    this.text = "",
    this.path = "/dashboard",
  }) : assert(percentage >= 0 && percentage <= 1);

  final double percentage;
  final Widget icon;
  final String text;
  final String path;

  @override
  MenuItemState createState() => MenuItemState();
}

class MenuItemState extends ConsumerState<MenuItem> {
  bool isHovered = false;
  void onItemTapped(String path) {
    GoRouter.of(context).go(path);
    ref.read(sidebarShowMobileProvider.notifier).state = false;
  }

  bool activePath(String path) {
    final location = GoRouterState.of(context).uri.path;
    return location.startsWith(path);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Tooltip(
        message: widget.text,
        child: Material(
          borderRadius: BorderRadius.circular(20),
          color: activePath(widget.path)
              ? Colors.lightBlue.withOpacity(0.2)
              : Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: activePath(widget.path)
                ? null
                : () => onItemTapped(widget.path),
            child: MouseRegion(
              onHover: (event) => setState(() => isHovered = true),
              onExit: (event) => setState(() => isHovered = false),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 9,
                  horizontal: widget.percentage > 0.5 ? 15 : 0,
                ),
                child: Row(
                  mainAxisAlignment: widget.percentage > 0.5
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedScale(
                      scale: isHovered ? 1.15 : 1.0,
                      duration: const Duration(milliseconds: 300),
                      child: widget.icon,
                    ),
                    // text
                    if (widget.percentage > 0.5)
                      Flexible(
                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInToLinear,
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: widget.percentage,
                            curve: Curves.easeInToLinear,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                widget.text,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
