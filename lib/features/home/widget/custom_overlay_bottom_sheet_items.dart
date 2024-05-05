import 'package:flutter/material.dart';

class TmpIcon extends StatelessWidget {
  final IconData icon;

  const TmpIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      padding: const EdgeInsets.only(
        top: 14,
        left: 13,
        right: 14,
        bottom: 14,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0xFFF4F4F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Icon(icon),
    );
  }
}
