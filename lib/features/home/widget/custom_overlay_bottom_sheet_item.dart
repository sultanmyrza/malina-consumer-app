import 'package:flutter/material.dart';
import 'package:malina_consumer_app/theme/colors.dart';

class CustomOverlayBottomSheetItem extends StatelessWidget {
  final String text;
  final Widget child;
  final int? badgeCount;

  const CustomOverlayBottomSheetItem({
    super.key,
    required this.child,
    required this.text,
    this.badgeCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 60,
          height: 60,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: AppColors.softGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 20, width: 20, child: child),
              Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF1D1D1D),
                  fontSize: 10,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
        if (badgeCount != null) _BadgeCount(badgeCount: badgeCount!)
      ],
    );
  }
}

class _BadgeCount extends StatelessWidget {
  final int badgeCount;

  const _BadgeCount({
    super.key,
    required this.badgeCount,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 4,
      top: 4,
      child: Container(
        width: 13,
        height: 13,
        child: Stack(
          children: [
            Container(
              width: 13,
              height: 13,
              decoration: const ShapeDecoration(
                color: Color(0xFFF72055),
                shape: OvalBorder(),
              ),
            ),
            Center(
              child: Text(
                badgeCount.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
