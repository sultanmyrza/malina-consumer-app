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
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20), // Spacing before Search Bar
              MalinaSearchBar(),
              SizedBox(height: 14), // Spacing before Barcode Banner
              BarcodeBanner(),
              SizedBox(height: 20), // Spacing before Categoryy Banner
              CategoryBanner(),
              SizedBox(height: 20), // Spacing before Categoryy Banner
              CategoryBanner(),
              SizedBox(height: 30), // Spacing for bottom space
              ComingSoonSection(),
              SizedBox(height: 30), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }
}
