import 'package:animated_sidebar/providers/sidebar_provider.dart';
import 'package:animated_sidebar/ui/shared/widget/account_item.dart';
import 'package:animated_sidebar/ui/shared/widget/logo_item.dart';
import 'package:animated_sidebar/ui/shared/widget/menu_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideBar extends ConsumerWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isCollapsed = ref.watch(isCollapsedSideBarProvider);
    var sidebarMobileShow = ref.watch(sidebarShowMobileProvider);

    final theme = Theme.of(context);
    const double minSidebarWidth = 60.0;
    const double maxSidebarWidth = 250.0;
    final size = MediaQuery.of(context).size;
    final widthDesktop = isCollapsed ? minSidebarWidth : maxSidebarWidth;
    const widthMobile = 250.0;

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          height: double.infinity,
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: sidebarMobileShow && size.width < 600
                ? widthMobile
                : widthDesktop,
            curve: Curves.easeInToLinear,
            child: LayoutBuilder(builder: (context, constraints) {
              double maxWidth = constraints.maxWidth;
              double percentage = (maxWidth - minSidebarWidth) /
                  (maxSidebarWidth - minSidebarWidth);

              // print("percentage $percentage");
              return Column(
                children: [
                  // logo
                  LogoItem(percentage: percentage),
                  const SizedBox(height: 10),
                  // menu item
                  Expanded(
                    child: ListView(
                      children: [
                        MenuItem(
                          percentage: percentage,
                          icon: const Icon(CupertinoIcons.square_grid_2x2),
                          text: "Dashboard",
                        ),
                        MenuItem(
                          percentage: percentage,
                          icon: const Icon(CupertinoIcons.cube_box),
                          text: "Prodcuts",
                          path: '/products',
                        ),
                        MenuItem(
                          percentage: percentage,
                          icon: Stack(
                            children: [
                              const Icon(CupertinoIcons.calendar),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 255, 102, 82),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          text: "Calendar",
                          path: '/calendar',
                        ),
                        MenuItem(
                          percentage: percentage,
                          icon: const Icon(CupertinoIcons.car),
                          text: "Suppliers",
                          path: '/suppliers',
                        ),
                        MenuItem(
                          percentage: percentage,
                          icon: const Icon(CupertinoIcons.chart_bar_square),
                          text: "Reports",
                          path: '/reports',
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Divider(
                            color: Colors.grey.shade500.withOpacity(0.25),
                          ),
                        ),
                        MenuItem(
                          percentage: percentage,
                          icon: Stack(
                            children: [
                              const Icon(CupertinoIcons.bell),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 255, 102, 82),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          text: "Notifications",
                          path: '/notifications',
                        ),
                        MenuItem(
                          percentage: percentage,
                          icon: const Icon(CupertinoIcons.settings),
                          text: "Settings",
                          path: '/settings',
                        ),
                        MenuItem(
                          percentage: percentage,
                          icon: const Icon(CupertinoIcons.info),
                          text: "Support",
                          path: '/support',
                        ),
                        if (percentage > 0.8) const UpgradeForFree(),
                      ],
                    ),
                  ),
                  // account
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Divider(
                      color: Colors.grey.shade500.withOpacity(0.25),
                    ),
                  ),
                  AccountItem(percentage: percentage),
                ],
              );
            }),
          ),
        ),
        // button collapsed en modo dektop y tablet
        if (size.width > 600)
          Positioned(
            right: 0,
            top: 30,
            child: IconButton(
              iconSize: 15,
              constraints: const BoxConstraints(maxHeight: 35, maxWidth: 35),
              padding: const EdgeInsets.all(6),
              onPressed: () {
                ref.read(isCollapsedSideBarProvider.notifier).state =
                    !isCollapsed;
              },
              icon: AnimatedRotation(
                turns: isCollapsed ? 0.5 : 0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInToLinear,
                child: const Icon(Icons.arrow_back_ios_rounded),
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(theme.cardColor),
                side: WidgetStatePropertyAll(
                  BorderSide(
                    color: Colors.grey.shade600.withOpacity(0.15),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class UpgradeForFree extends StatelessWidget {
  const UpgradeForFree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 5,
          ).copyWith(top: 40),
          child: Image.asset(
            "assets/images/moneyversehomeoffice.png",
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              Colors.deepPurpleAccent.shade400,
            ),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(
                horizontal: 45,
                vertical: 15,
              ),
            ),
          ),
          onPressed: () {},
          child: const Text(
            "Upgrade for free",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
