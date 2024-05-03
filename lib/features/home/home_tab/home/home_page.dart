import 'package:flutter/material.dart';
import 'package:malina_consumer_app/features/home/home_tab/home/widgets/barcode_banner.dart';
import 'package:malina_consumer_app/features/home/home_tab/home/widgets/category_banner.dart';
import 'package:malina_consumer_app/features/home/home_tab/home/widgets/coming_soon_list.dart';
import 'package:malina_consumer_app/features/home/home_tab/home/widgets/search_bar.dart';

class HomeTabPage extends StatelessWidget {
  const HomeTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width to make our UI responsive
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20), // Spacing before Search Bar
              const MalinaSearchBar(),
              const SizedBox(height: 14), // Spacing before Barcode Banner
              const BarcodeBanner(),
              const SizedBox(height: 20), // Spacing before Categoryy Banner
              CategoryBanner(
                title: "Едв",
                subtitle: "Из кафе и ресторанов",
                assetPath: "assets/images/food_banner.jpeg",
                onTap: () {
                  // TODO: @sultanmyrza implement
                },
              ),
              const SizedBox(height: 20), // Spacing before Categoryy Banner
              CategoryBanner(
                title: "Бьюти",
                subtitle: "Салоны красоты и товары",
                assetPath: "assets/images/beauty_banner.jpeg",
                onTap: () {
                  // TODO: @sultanmyrza implement
                },
              ),
              const SizedBox(height: 30), // Spacing for bottom space
              const ComingSoonSection(),
              const SizedBox(height: 30), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }
}
