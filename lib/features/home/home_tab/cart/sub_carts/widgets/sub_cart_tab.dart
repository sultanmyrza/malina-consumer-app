import 'package:flutter/material.dart';
import 'package:malina_consumer_app/features/home/home_tab/cart/sub_carts/goods_cart/goods_cart_page.dart';
import 'package:malina_consumer_app/theme/colors.dart';

class SubCartTabBar extends StatelessWidget {
  final SubCartTab selectedTab;
  final ValueChanged<SubCartTab> onPressed;

  const SubCartTabBar({
    super.key,
    required this.selectedTab,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Row(
        children: [
          Expanded(
            child: _ToggledStyleButton(
              label: "Доставка",
              isSelected: selectedTab == SubCartTab.delivery,
              onPressed: () => onPressed(SubCartTab.delivery),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _ToggledStyleButton(
              label: "В заведении",
              isSelected: selectedTab == SubCartTab.pickup,
              onPressed: () => onPressed(SubCartTab.pickup),
            ),
          ),
        ],
      ),
    );
  }
}

class _ToggledStyleButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const _ToggledStyleButton({
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: AppColors.malina,
        ),
        child: Text(label),
      );
    } else {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.black,
          side: const BorderSide(color: AppColors.grey),
        ),
        child: Text(label),
      );
    }
  }
}
