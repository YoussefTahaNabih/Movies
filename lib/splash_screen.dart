import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:movies/core/utils/colors_manger.dart';
import 'package:movies/core/utils/string_manger.dart';
import 'package:movies/core/utils/assets_manger.dart';
import 'package:movies/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        Get.to(MainScreen());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Lottie.asset(
              JsonAssets.splashImage,
              height: 200,
              width: 200,
            ),
          ),
          Text(
            StringManger.appName,
            style: Theme.of(context).textTheme.displayLarge,
          )
        ],
      ),
    );
  }
}
