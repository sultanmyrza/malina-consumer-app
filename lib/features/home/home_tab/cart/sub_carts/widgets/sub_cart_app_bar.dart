import 'package:flutter/material.dart';

class SubCartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onClear;
  final VoidCallback goBack;

  const SubCartAppBar({
    super.key,
    required this.onClear,
    required this.goBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      titleSpacing: 0,
      leading: BackButton(
        onPressed: goBack,
      ),
      title: const Text(
        'Корзина',
        style: TextStyle(
          color: Color(0xFF1D1D1D),
          fontSize: 20,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onClear,
          child: const Text(
            'Очистить',
            style: TextStyle(
              color: Color(0xFF1D1D1D),
              fontSize: 14,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
