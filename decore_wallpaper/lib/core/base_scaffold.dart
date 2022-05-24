import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BaseScaffold extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final bool? isAppbarRequired;
  final bool? isBottomNavBarRequired;
  final Widget? leftOfAppBar;
  final Color? backgroundColor;
  final BottomNavigationBar? bottomNavigationBar;
  const BaseScaffold({
    Key? key,
    @required this.body,
    this.appBar,
    @required this.isAppbarRequired,
    this.backgroundColor = Colors.white,
    this.leftOfAppBar,
    this.bottomNavigationBar,
    @required this.isBottomNavBarRequired,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConnectivityBuilder(
      builder: (BuildContext context, bool? isConnected,
          ConnectivityStatus? status) {
        return isConnected == null || isConnected
            ? Scaffold(
                appBar: isAppbarRequired as bool ? appBar : null,
                backgroundColor: backgroundColor,
                body: body as Widget,
                bottomNavigationBar:
                    isBottomNavBarRequired as bool ? bottomNavigationBar : null,
              )
            : Scaffold(
                body: Center(
                  child: Lottie.asset("assets/images/no_connection.json"),
                ),
              );
      },
    );
  }
}
