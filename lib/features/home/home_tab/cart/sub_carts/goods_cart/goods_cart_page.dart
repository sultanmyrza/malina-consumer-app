import 'package:flutter/material.dart';

import '../widgets/sub_cart_app_bar.dart';

class GoodsCartPage extends StatelessWidget {
  final VoidCallback goBack;

  const GoodsCartPage({
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
        "Товары",
        style: Theme.of(context).textTheme.headlineLarge,
      )),
    );
    ;
  }
}
