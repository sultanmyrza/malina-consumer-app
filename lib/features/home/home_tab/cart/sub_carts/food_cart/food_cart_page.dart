import 'package:flutter/material.dart';

import '../sub_carts_sample_items.dart';
import '../widgets/cart_group.dart';
import '../widgets/sub_cart_app_bar.dart';
import '../widgets/sub_cart_tab.dart';

enum SubCartTab { delivery, pickup }

class FoodsCartPage extends StatefulWidget {
  final VoidCallback goBack;

  const FoodsCartPage({
    super.key,
    required this.goBack,
  });

  @override
  State<FoodsCartPage> createState() => _FoodsCartPageState();
}

class _FoodsCartPageState extends State<FoodsCartPage> {
  var selectedTab = SubCartTab.delivery;
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
            SubCartTabBar(
              selectedTab: selectedTab,
              onPressed: (value) => setState(() => selectedTab = value),
            ),
            const SizedBox(height: 20),
            if (selectedTab == SubCartTab.delivery)
              CartGroup(
                header: "Bellagio Coffee",
                items: [sampleCartItems[0]],
                canAddToGroup: true,
              ),
            const SizedBox(height: 200)
          ],
        ),
      ),
    );
  }
}
