import 'package:animated_sidebar/ui/shared/button_sidebar.dart';
import 'package:animated_sidebar/ui/shared/button_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          if (size.width < 600) const ButtonSidebar(),
          const Spacer(),
          const ThemeButton(),
        ],
      ),
    );
  }
}
