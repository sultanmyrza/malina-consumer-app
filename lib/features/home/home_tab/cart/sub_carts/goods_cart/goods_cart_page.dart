import 'package:flutter/material.dart';
import 'package:malina_consumer_app/features/home/home_tab/cart/sub_carts/sub_carts_sample_items.dart';
import 'package:malina_consumer_app/features/home/home_tab/cart/sub_carts/widgets/cart_group.dart';

import '../widgets/sub_cart_app_bar.dart';

class GoodsCartPage extends StatefulWidget {
  final VoidCallback goBack;

  const GoodsCartPage({
    super.key,
    required this.goBack,
  });

  @override
  State<GoodsCartPage> createState() => _GoodsCartPageState();
}

class _GoodsCartPageState extends State<GoodsCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubCartAppBar(
        goBack: widget.goBack,
        onClear: () => print("Clear action triggered"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 12),
            const SizedBox(height: 20),
            CartGroup(
              header: "Hair",
              items: [sampleCartItems[1], sampleCartItems[2]],
            ),
            const SizedBox(height: 16),
            CartGroup(
              header: "Preen Beauty",
              items: [sampleCartItems[3]],
            ),
            const SizedBox(height: 200)
          ],
        ),
      ),
    );
  }
}
