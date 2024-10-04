import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,
    required this.percentage,
    this.name = "Charli D'amelio",
  });

  final double percentage;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 6,
          horizontal: percentage > 0.5 ? 10 : 0,
        ),
        child: Row(
          mainAxisAlignment: percentage > 0.5
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Tooltip(
              message: name,
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/woman.jpg"),
              ),
            ),
            // contenido
            if (percentage > 0.5)
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInToLinear,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: percentage,
                      curve: Curves.easeInToLinear,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "Welcome back",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade800,
                                          ),
                                    ),
                                    TextSpan(
                                      text: "👋",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ]),
                                ),
                                Text(
                                  name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          if (percentage > 0.5)
                            const Icon(
                              CupertinoIcons.forward,
                              size: 20,
                            )
                        ],
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
