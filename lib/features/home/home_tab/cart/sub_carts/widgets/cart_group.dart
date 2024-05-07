import 'package:flutter/material.dart';
import 'package:malina_consumer_app/features/home/home_tab/cart/sub_carts/sub_carts_sample_items.dart';
import 'package:malina_consumer_app/features/home/home_tab/cart/sub_carts/widgets/cart_group_add_button.dart';
import 'package:malina_consumer_app/features/home/home_tab/cart/sub_carts/widgets/cart_group_list.dart';
import 'package:malina_consumer_app/features/home/home_tab/cart/sub_carts/widgets/cart_group_list_header.dart';

import 'cart_group_order_button.dart';

class CartGroup extends StatelessWidget {
  final String header;
  final List<ISubCartItem> items;
  final bool canAddToGroup;

  const CartGroup({
    super.key,
    required this.header,
    required this.items,
    this.canAddToGroup = false,
  });

  @override
  Widget build(BuildContext context) {
    return _CardGroupContainer(
      child: Column(
        children: [
          CartGroupListHeader(text: header),
          CartGroupList(items: items),
          if (canAddToGroup == true) ...[
            const CartGroupAddButton(),
            const SizedBox(height: 20),
          ],
          const CartGroupOrderButton(),
        ],
      ),
    );
  }
}

class _CardGroupContainer extends StatelessWidget {
  final Widget child;

  const _CardGroupContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(20),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x195E6672),
            blurRadius: 20,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}
