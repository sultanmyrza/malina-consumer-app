import 'package:flutter/material.dart';

class CustomOverlayBottomSheetPainter extends StatelessWidget {
  const CustomOverlayBottomSheetPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: const Size(70, 135),
        painter: MyCustomPainter(),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    var rrect = RRect.fromRectAndCorners(
      rect,
      topLeft: const Radius.circular(50),
      topRight: const Radius.circular(50),
    );

    // Create a path that includes only the top part of the rectangle
    var path = Path()
      ..moveTo(
          0,
          size.height /
              2) // Start from the middle to ensure no shadow at the bottom
      ..lineTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height / 2)
      ..arcToPoint(
        Offset(0, size.height / 2),
        radius: const Radius.circular(50),
        clockwise: false,
      );

    // Draw shadow for the top half only
    canvas.drawShadow(
      path,
      const Color(0x19717171),
      20.0,
      false,
    );

    // Draw the rounded rectangle
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
