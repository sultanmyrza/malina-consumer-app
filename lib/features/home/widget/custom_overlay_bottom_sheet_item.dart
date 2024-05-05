import 'package:flutter/material.dart';
import 'package:malina_consumer_app/theme/colors.dart';

class CustomOverlayBottomSheetItem extends StatelessWidget {
  final String text;
  final Widget child;

  const CustomOverlayBottomSheetItem({
    super.key,
    required this.child,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
