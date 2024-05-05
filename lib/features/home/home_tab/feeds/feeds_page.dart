import 'package:flutter/material.dart';

class FeedsPage extends StatelessWidget {
  const FeedsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Лента",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
