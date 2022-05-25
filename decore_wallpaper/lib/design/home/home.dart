import 'package:decore_wallpaper/core/base_notifier.dart';
import 'package:decore_wallpaper/core/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BaseScaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.all(size.height * 0.01),
        width: size.width,
        height: size.height,
      ),
      isAppbarRequired: false,
      isBottomNavBarRequired: false,
    );
  }
}
