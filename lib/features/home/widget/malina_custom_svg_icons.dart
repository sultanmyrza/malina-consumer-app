import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum MalinIcons {
  feed,
  feedActive,
  favoirte,
  favoirteActive,
  home,
  homeActive,
  profile,
  profileActive,
  cart,
  cartActive,
  food,
  cosmetic,
  cartGroupAdd,
  delete
}

class MalinaIcon extends StatelessWidget {
  final MalinIcons icon;
  const MalinaIcon(
    this.icon, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    switch (icon) {
      case MalinIcons.feed:
        return SvgPicture.asset('assets/icons/feed.svg');
      case MalinIcons.feedActive:
        return SvgPicture.asset('assets/icons/feedActive.svg');
      case MalinIcons.favoirte:
        return SvgPicture.asset('assets/icons/favorite.svg');
      case MalinIcons.favoirteActive:
        return SvgPicture.asset('assets/icons/favoriteActive.svg');
      case MalinIcons.home:
        return SvgPicture.asset('assets/icons/home.svg');
      case MalinIcons.homeActive:
        return SvgPicture.asset('assets/icons/homeActive.svg');
      case MalinIcons.profile:
        return SvgPicture.asset('assets/icons/profile.svg');
      case MalinIcons.profileActive:
        return SvgPicture.asset('assets/icons/profileActive.svg');
      case MalinIcons.cart:
        return SvgPicture.asset('assets/icons/cart.svg');
      case MalinIcons.cartActive:
        return SvgPicture.asset('assets/icons/cartActive.svg');
      case MalinIcons.food:
        return SvgPicture.asset('assets/icons/food.svg');
      case MalinIcons.cosmetic:
        return SvgPicture.asset('assets/icons/cosmetic.svg');
      case MalinIcons.cartGroupAdd:
        return SvgPicture.asset('assets/icons/cartGroupAdd.svg');
      case MalinIcons.delete:
        return SvgPicture.asset('assets/icons/delete.svg');
    }
  }
}

/// Temporary workaround to wrap Icon in Bottom Nav Bar TODO: @sultanmyrza
/// find better solution. Use current due to deadline pressure.
class MalinaIconWrapper extends StatelessWidget {
  final Widget child;

  const MalinaIconWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var decoration = ShapeDecoration(
      color: const Color(0xFFF72055),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(48.39),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x59AA0C33),
          blurRadius: 14.73,
          offset: Offset(0, 0),
          spreadRadius: 0,
        )
      ],
    );

    return SizedBox(
      height: 35,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -4,
            left: 10,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: decoration,
              child: child,
            ),
          )
        ],
      ),
    );
  }
}
