import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:malina_consumer_app/theme/colors.dart';

import '../barcode_scanner/barcode_scanner_page.dart';

class BarcodeBanner extends StatelessWidget {
  const BarcodeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BarcodeScannerPage()),
        )
      },
      child: Container(
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
        child: Row(
          children: [
            SvgPicture.asset("assets/icons/barcode_icon.svg"),
            const SizedBox(width: 16),
            const Flexible(
              child: Text(
                // TODO: @sultanmyrza localize
                'Сканируй QR-код и заказывай прямо в заведении',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
