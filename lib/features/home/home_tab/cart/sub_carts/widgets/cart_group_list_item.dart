import 'package:flutter/material.dart';
import 'package:malina_consumer_app/features/home/home_tab/cart/sub_carts/sub_carts_sample_items.dart';
import 'package:malina_consumer_app/features/home/widget/malina_custom_svg_icons.dart';
import 'package:malina_consumer_app/theme/colors.dart';

class CartGroupListItem extends StatelessWidget {
  final ISubCartItem item;

  const CartGroupListItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _ItemThumbnail(item.thumbnail),
          const SizedBox(width: 8),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ItemTitle(title: item.title, price: item.price),
                const SizedBox(height: 4),
                _ItemDescription(desciption: item.description),
                const SizedBox(height: 10),
                _ItemActionButtons(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ItemThumbnail extends StatelessWidget {
  final Widget thumbnail;

  const _ItemThumbnail(this.thumbnail);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      padding: const EdgeInsets.all(4),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFF8F8F8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: thumbnail,
    );
  }
}

class _ItemTitle extends StatelessWidget {
  final String title;
  final double price;

  const _ItemTitle({
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    var priceText =
        price.remainder(1) == 0 ? price.toInt() : price.toStringAsFixed(2);

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF1D1D1D),
            fontSize: 16,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            height: 0.07,
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$priceText ',
                style: const TextStyle(
                  color: Color(0xFF1D1D1D),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              const TextSpan(
                text: 'C',
                style: TextStyle(
                  color: Color(0xFF1D1D1D),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ItemDescription extends StatelessWidget {
  final String desciption;

  const _ItemDescription({required this.desciption});

  @override
  Widget build(BuildContext context) {
    return Text(
      desciption,
      style: const TextStyle(
        color: Color(0xFF777777),
        fontSize: 12,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
        height: 1.2,
      ),
      maxLines: 3,
    );
  }
}

class _ItemActionButtons extends StatelessWidget {
  const _ItemActionButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _CartItemActionButton(icon: const Icon(Icons.remove), onTap: () {}),
        const SizedBox(width: 12),
        const _CartItemQuantity(),
        const SizedBox(width: 12),
        _CartItemActionButton(icon: const Icon(Icons.add), onTap: () {}),
        const Spacer(),
        _CartItemActionButton(
          icon: const MalinaIcon(MalinIcons.delete),
          onTap: () {},
          isGreyBackground: false,
        )
      ],
    );
  }
}

class _CartItemQuantity extends StatelessWidget {
  const _CartItemQuantity();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '1',
      style: TextStyle(
        color: Color(0xFF1D1D1D),
        fontSize: 18,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w700,
        height: 0,
      ),
    );
  }
}

class _CartItemActionButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  final bool isGreyBackground;

  const _CartItemActionButton({
    required this.icon,
    required this.onTap,
    this.isGreyBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isGreyBackground ? AppColors.softGrey : Colors.transparent;

    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.44),
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(9.44),
          onTap: onTap,
          child: Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            child: icon,
          ),
        ),
      ),
    );
  }
}
