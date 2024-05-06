import 'package:flutter/material.dart';
import 'package:malina_consumer_app/features/home/home_tab/cart/sub_carts/widgets/sub_cart_tab.dart';

import '../widgets/sub_cart_app_bar.dart';

enum SubCartTab { delivery, pickup }

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
  var selectedTab = SubCartTab.delivery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubCartAppBar(
        goBack: widget.goBack,
        onClear: () => print("Clear action triggered"),
      ),
      body: ListView(
        children: [
          SubCartTabBar(
            selectedTab: selectedTab,
            onPressed: (value) => setState(() => selectedTab = value),
          )
        ],
      ),
    );
    ;
  }
}
