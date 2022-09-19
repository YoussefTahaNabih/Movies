import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/core/global/localization/translation.dart';
import 'package:movies/core/utils/string_manger.dart';
import 'package:movies/splash_screen.dart';

import 'core/utils/theme_manger.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringManger.appName,
        translations: Translation(),
        locale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        theme: getAppTheme(),
        home: const SplashScreen());
  }
}
