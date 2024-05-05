import 'package:flutter/material.dart';

import '../widgets/sub_cart_app_bar.dart';

class FoodsCartPage extends StatelessWidget {
  final VoidCallback goBack;

  const FoodsCartPage({
    super.key,
    required this.goBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubCartAppBar(
        goBack: goBack,
        onClear: () => print("Clear action triggered"),
      ),
      body: Center(
        child: Text(
          "Еда",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
