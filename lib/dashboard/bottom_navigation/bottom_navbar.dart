import 'package:flexfund_app/dashboard/dashboard_screens/create_fundraising/create_fundraising.dart';
import 'package:flexfund_app/dashboard/dashboard_screens/history/history.dart';
import 'package:flexfund_app/dashboard/dashboard_screens/home.dart';
import 'package:flexfund_app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    super.initState();
    bottomNavigationController = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [const Dashboard(), CreateFundraising(), History()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Dashboard"),
        activeColorPrimary: FlexFundTheme.primaryGreen,
        inactiveColorPrimary: Colors.grey,
      ),

      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add),
        title: "Create",
        activeColorPrimary: FlexFundTheme.primaryGreen,
        inactiveColorPrimary: Colors.grey,
        activeColorSecondary: Colors.white,
      ),

      PersistentBottomNavBarItem(
        icon: const Icon(Icons.history),
        title: ("History"),
        activeColorPrimary: FlexFundTheme.primaryGreen,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: bottomNavigationController,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineToSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: false,
        hideNavigationBarWhenKeyboardAppears: true,
        decoration: const NavBarDecoration(colorBehindNavBar: Colors.white),
        popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
        navBarStyle: NavBarStyle.style15,
        onItemSelected: (value) {},
      ),
    );
  }
}
