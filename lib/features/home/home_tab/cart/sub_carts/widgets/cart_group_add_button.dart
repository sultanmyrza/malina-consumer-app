import 'package:flutter/material.dart';
import 'package:malina_consumer_app/features/home/widget/malina_custom_svg_icons.dart';

class CartGroupAddButton extends StatelessWidget {
  const CartGroupAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: ShapeDecoration(
          color: const Color(0xFFF8F8F8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            // Add your onTap action here
          },
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: const Row(
              children: [
                MalinaIcon(MalinIcons.cartGroupAdd),
                SizedBox(width: 8),
                Text(
                  'Добавки',
                  style: TextStyle(
                    color: Color(0xFF1D1D1D),
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
