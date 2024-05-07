import 'package:flutter/material.dart';

class CartGroupListHeader extends StatelessWidget {
  final String text;

  const CartGroupListHeader({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return _CartGroupListHeaderContainer(
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF5E5E5E),
              fontSize: 16,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              height: 0.07,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 14,
            color: Color(0xFF5E5E5E),
          ),
        ],
      ),
    );
  }
}

class _CartGroupListHeaderContainer extends StatelessWidget {
  final Widget child;
  const _CartGroupListHeaderContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 6),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFEDEBEB),
            width: 1.0,
          ),
        ),
      ),
      child: child,
    );
  }
}
