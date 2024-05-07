import 'package:flutter/material.dart';

class ComingSoonHeader extends StatelessWidget {
  const ComingSoonHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        'Скоро в Malina', // TODO: @sultanmyrza localize
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class ComingSoonListItem extends StatelessWidget {
  final String text;
  final Color color;
  final EdgeInsets margin;

  const ComingSoonListItem({
    super.key,
    required this.text,
    required this.color,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 86,
      height: 86,
      margin: margin,
      padding: const EdgeInsets.only(bottom: 6),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: @sultanmyrza localize comingSoonItemsText
    const comingSoonItemsText = ["Вакансии", "Маркет", "Цветы", "Спорт"];
    const comingSoonItemsColor = [
      Color(0xffD4E5FF),
      Color(0xFFFFD3BA),
      Color(0xFFFFDEDE),
      Color(0xFFCFF2E3),
    ];

    return Container(
      height: 86,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: comingSoonItemsText.length,
        itemBuilder: (context, index) {
          const firstItemMargin = EdgeInsets.only(left: 20);
          const nthItemMargin = EdgeInsets.only(left: 12);
          const lastItemMargin = EdgeInsets.only(left: 12, right: 20);
          var itemMargin = index == 0
              ? firstItemMargin
              : index < comingSoonItemsText.length - 1
                  ? nthItemMargin
                  : lastItemMargin;

          return ComingSoonListItem(
            text: comingSoonItemsText[index],
            color: comingSoonItemsColor[index],
            margin: itemMargin,
          );
        },
      ),
    );
  }
}

class ComingSoonSection extends StatelessWidget {
  const ComingSoonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ComingSoonHeader(),
        SizedBox(height: 8), // Spacing between Header and List
        ComingSoonList(),
      ],
    );
  }
}
