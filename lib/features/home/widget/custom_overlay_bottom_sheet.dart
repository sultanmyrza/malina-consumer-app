import 'package:flutter/material.dart';
import 'package:malina_consumer_app/features/home/widget/custom_overlay_bottom_sheet_painter.dart';

import '../home_page.dart';
import 'custom_overlay_bottom_sheet_items.dart';

class CustomOverlayBottomSheet extends StatefulWidget {
  final bool isExpanded;
  final VoidCallback? onDismiss;
  final ValueChanged<CartPageSubCarts>? onSelect;

  const CustomOverlayBottomSheet({
    super.key,
    required this.isExpanded,
    this.onDismiss,
    this.onSelect,
  });

  @override
  State<CustomOverlayBottomSheet> createState() =>
      _CustomOverlayBottomSheetState();
}

class _CustomOverlayBottomSheetState extends State<CustomOverlayBottomSheet> {
  @override
  Widget build(BuildContext context) {
    const double bottomNavBarHeight = 70.0;
    const double spacingBetweenIcons = 8;
    const double iconHeight = 60;

    return Stack(
      children: [
        if (widget.isExpanded)
          GestureDetector(
            onTap: widget.onDismiss,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
            ),
          ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          bottom: widget.isExpanded ? bottomNavBarHeight : -200,
          right: 8,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: widget.isExpanded ? 1 : 0,
            child: const CustomOverlayBottomSheetPainter(),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          bottom: widget.isExpanded ? bottomNavBarHeight : -200,
          right: 12.5,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: widget.isExpanded ? 1 : 0,
            child: GestureDetector(
              onTap: () {
                widget.onSelect?.call(CartPageSubCarts.foodsCart);
              },
              child: const TmpIcon(icon: Icons.foggy),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          bottom: widget.isExpanded
              ? bottomNavBarHeight + iconHeight + spacingBetweenIcons
              : -200,
          right: 12.5,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: widget.isExpanded ? 1 : 0,
            child: GestureDetector(
              onTap: () {
                widget.onSelect?.call(CartPageSubCarts.goodsCart);
              },
              child: const TmpIcon(icon: Icons.shop_2),
            ),
          ),
        ),
      ],
    );
  }
}
