import 'package:flutter/material.dart';
import 'package:malina_consumer_app/features/home/home_tab/cart/sub_carts/sub_carts_sample_items.dart';
import 'package:malina_consumer_app/features/home/home_tab/cart/sub_carts/widgets/cart_group_list_item.dart';

class CartGroupList extends StatelessWidget {
  final List<ISubCartItem> items;

  const CartGroupList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        children: items.map((item) => CartGroupListItem(item: item)).toList(),
      ),
    );
  }
}
