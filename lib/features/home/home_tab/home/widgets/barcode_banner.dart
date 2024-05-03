import 'package:flutter/material.dart';
import 'package:malina_consumer_app/theme/colors.dart';

class BarcodeBanner extends StatelessWidget {
  const BarcodeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: @sultanmyrza implement BarcodeBanner widget
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 90,
          padding: const EdgeInsets.all(16),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: AppColors.malina,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
