import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'core/services/services_locator.dart';

void main() async {
  await GetStorage.init();
  ServicesLocator().init();
  runApp(const MoviesApp());
}
