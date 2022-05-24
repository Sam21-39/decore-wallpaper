import 'package:decore_wallpaper/design/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Decore - Wallpapers',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.teal,
      ),
      home: const Splash(),
    );
  }
}
