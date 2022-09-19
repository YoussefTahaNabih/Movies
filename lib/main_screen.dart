import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/core/controller/Navigation_controller.dart';
import 'package:movies/movies/presentation/screens/movies_screen.dart';
import 'package:movies/profile/presentation/screens/profile_screen.dart';

import 'core/utils/colors_manger.dart';
import 'tvs/presentation/screens/tv_screen.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());
  final screens = [
    const MoviesScreen(),
    const ProfileScreen(),
    const TvScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: bottomNavigationController.selectIndex.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: ColorManager.mainPrimary,
        activeColor: ColorManager.white,
        color: ColorManager.primary,
        style: TabStyle.react,
        items: const [
          TabItem(icon: Icons.movie),
          TabItem(icon: Icons.person),
          TabItem(icon: Icons.tv),
        ],
        initialActiveIndex: bottomNavigationController.selectIndex.value,
        onTap: (index) {
          bottomNavigationController.changeIndex(index);
        },
      ),
    );
  }
}
