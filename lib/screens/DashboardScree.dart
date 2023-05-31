import 'package:flutter/material.dart';
import 'package:store_side/screens/current_orders.dart';
import 'package:store_side/screens/past_orders.dart';
import 'package:store_side/screens/profilescreen.dart';
class DashboardScreen extends StatefulWidget {
  // bool flag;

  DashboardScreen();

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<DashboardModel> list = getDashboardList();

  int selectedTab = 0;

  Widget getFragment() {
    if (selectedTab == 0) {
      return CurrentOrders();
    } else if (selectedTab == 1) {
      return PastOrders();
    } else {
      return ProfileScreen();
    }
  }

  @override
  void dispose() {
    // if (widget.flag) {
    //   setStatusBarColor(appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor);
    // } else {
    //   setStatusBarColor(Colors.transparent);
    // }

    super.dispose();
  }

  Color getDashboardColor() {
    return Color(0xfff7f5f9);

    // if (!appStore.isDarkModeOn) {
    //   if (selectedTab == 1 || selectedTab == 2 || selectedTab == 3) {
    //     return bmSecondBackgroundColorLight;
    //   } else {
    //     return bmLightScaffoldBackgroundColor;
    //   }
    // } else {
    //   if (selectedTab == 1 || selectedTab == 2 || selectedTab == 3) {
    //     return bmSecondBackgroundColorDark;
    //   } else {
    //     return appStore.scaffoldBackground!;
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getDashboardColor(),
      body: getFragment(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            selectedTab = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Color(0xff515151),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedTab,
        items: list.map((e) {
          int index = list.indexOf(e);
          return BottomNavigationBarItem(
            icon: Icon(e.unSelectedIcon, color: Color(0xff515151)),
            activeIcon: index == 0
                ? Icon(e.selectedIcon, color: Color(0xff515151))
                : Icon(e.selectedIcon, color: Color(0xff515151)),
            label: '',
          );
        }).toList(),
      )
    );
  }
}

class DashboardModel {
  IconData selectedIcon;
  IconData unSelectedIcon;

  DashboardModel({required this.selectedIcon, required this.unSelectedIcon});
}

List<DashboardModel> getDashboardList() {
  List<DashboardModel> list = [];

  list.add(DashboardModel(
      selectedIcon: Icons.present_to_all,
      unSelectedIcon: Icons.present_to_all_outlined));
  list.add(DashboardModel(
      selectedIcon: Icons.paste,
      unSelectedIcon: Icons.paste_outlined));
  list.add(DashboardModel(
      selectedIcon: Icons.person,
      unSelectedIcon: Icons.person_outline));

  return list;
}
