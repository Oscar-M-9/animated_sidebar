import 'package:flutter/material.dart';

class LogoItem extends StatelessWidget {
  const LogoItem({
    super.key,
    required this.percentage,
  });

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 9,
          horizontal: percentage > 0.5 ? 10 : 0,
        ),
        child: Row(
          mainAxisAlignment: percentage > 0.5
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FlutterLogo(),
            if (percentage > 0.5)
              Flexible(
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInToLinear,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: percentage,
                    curve: Curves.easeInToLinear,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Flutter Solutions",
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
    );
  }
}
