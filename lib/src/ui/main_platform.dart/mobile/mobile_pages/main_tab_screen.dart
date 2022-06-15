import 'package:estate_project/src/core/utils/styles.dart';
import 'package:estate_project/src/ui/main_platform.dart/mobile/mobile_pages/first_screen/first_screen.dart';
import 'package:estate_project/src/ui/main_platform.dart/mobile/mobile_pages/others/others.dart';
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
            items: const [
              BottomNavigationBarItem(
                label: 'Chat',
                icon: ImageIcon(
                  AssetImage('assets/images/pngs/chat.png'),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Scan',
                icon: ImageIcon(
                  AssetImage('assets/images/pngs/scan1.png'),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Services',
                icon: ImageIcon(
                  AssetImage('assets/images/pngs/services.png'),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Me',
                icon: ImageIcon(
                  AssetImage('assets/images/pngs/Me.png'),
                ),
              )
            ]),
        tabBuilder: (context, index) {
          updateIndex(_controller.index);
          switch (index) {
            case 0:
              return CupertinoTabView(
                  navigatorKey: firstTabNavKey,
                  builder: (context) => const BlankPage());
            case 1:
              return CupertinoTabView(
                  navigatorKey: secondTabNavKey,
                  builder: (context) => const BlankPage());
            case 2:
              return CupertinoTabView(
                  navigatorKey: thirdTabNavKey,
                  builder: (context) => ServicesScreen());
            case 3:
              return CupertinoTabView(
                  navigatorKey: fourthTabNavKey,
                  builder: (context) => const BlankPage());

            default:
              return CupertinoTabView(
                  navigatorKey: fifthTabNavKey,
                  builder: (context) => const BlankPage());
          }
        },
      ),
    );
  }
}
