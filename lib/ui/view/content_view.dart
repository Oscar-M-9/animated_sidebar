import 'package:flutter/material.dart';

class ContentView extends StatelessWidget {
  const ContentView({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8)
          .copyWith(top: 0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text.toUpperCase(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
