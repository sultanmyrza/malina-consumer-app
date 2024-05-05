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
      body: const Center(child: Text("FoodsCartPage")),
    );
  }
}
