import 'package:decore_wallpaper/design/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 6700)).then((value) => Get.off(
          () => const Home(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 300),
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Lottie.asset("assets/images/geometry.zip"),
      ),
    );
  }
}
