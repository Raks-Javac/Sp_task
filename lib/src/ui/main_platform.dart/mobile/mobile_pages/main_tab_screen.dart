import 'package:estate_project/src/core/utils/styles.dart';
import 'package:estate_project/src/ui/main_platform.dart/mobile/mobile_pages/first_screen/first_screen.dart';
import 'package:estate_project/src/ui/shared/svg_render.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserMainDashBoard extends StatefulWidget {
  const UserMainDashBoard({Key? key}) : super(key: key);

  @override
  State<UserMainDashBoard> createState() => _UserMainDashBoardState();
}

class _UserMainDashBoardState extends State<UserMainDashBoard> {
  GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> fourthTabNavKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> fifthTabNavKey = GlobalKey<NavigatorState>();

  final CupertinoTabController _controller = CupertinoTabController();

  var currentIndex = 3;

  Future<void> updateIndex(int index) async {
    currentIndex = index;
  }

  GlobalKey<NavigatorState> currentNavigatorKey() {
    switch (currentIndex) {
      case 0:
        return firstTabNavKey;

      case 1:
        return secondTabNavKey;

      case 2:
        return thirdTabNavKey;

      case 3:
        return fourthTabNavKey;
    }
    return firstTabNavKey;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var popValue = !await currentNavigatorKey().currentState!.maybePop();
        return popValue;
      },
      child: CupertinoTabScaffold(
        controller: _controller,
        tabBar: CupertinoTabBar(
            backgroundColor: Colors.white,
            activeColor: appColor,
            inactiveColor: Colors.grey,
            border: Border.all(color: Colors.white),
            items: [
              BottomNavigationBarItem(
                  label: 'Chat',
                  icon: RenderSvg(
                    svgPath: "assets/images/svgs/chat.svg",
                    color: Colors.grey[400],
                  )),
              BottomNavigationBarItem(
                  label: 'Scan',
                  icon: RenderSvg(
                    svgPath: "assets/images/svgs/scan1.svg",
                    color: Colors.grey[400],
                  )),
              BottomNavigationBarItem(
                  label: 'Services',
                  icon: RenderSvg(
                    svgPath: "assets/images/svgs/services.svg",
                    color: appColor,
                  )),
              BottomNavigationBarItem(
                  label: 'Me',
                  icon: RenderSvg(
                    svgPath: "assets/images/svgs/Me.svg",
                    color: Colors.grey[400],
                  )),
            ]),
        tabBuilder: (context, index) {
          updateIndex(_controller.index);
          switch (index) {
            case 0:
              return CupertinoTabView(
                  navigatorKey: firstTabNavKey,
                  builder: (context) => ServicesScreen());
            case 1:
              return CupertinoTabView(
                  navigatorKey: secondTabNavKey,
                  builder: (context) => ServicesScreen());
            case 2:
              return CupertinoTabView(
                  navigatorKey: thirdTabNavKey,
                  builder: (context) => ServicesScreen());
            case 3:
              return CupertinoTabView(
                  navigatorKey: fourthTabNavKey,
                  builder: (context) => ServicesScreen());

            default:
              return CupertinoTabView(
                  navigatorKey: fifthTabNavKey,
                  builder: (context) => ServicesScreen());
          }
        },
      ),
    );
  }
}
