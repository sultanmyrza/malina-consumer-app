import 'package:flutter/material.dart';

class MalinaSearchBar extends StatelessWidget {
  const MalinaSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 60,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x195E6672),
            blurRadius: 20,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 38, height: 38, child: Icon(Icons.search)),
            SizedBox(width: 4),
            Text(
              'Искать в Malina', // TODO: @sultanmyrza localize
              style: TextStyle(
                color: Color(0xFF828282),
                fontSize: 14,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                height: 0.09,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
