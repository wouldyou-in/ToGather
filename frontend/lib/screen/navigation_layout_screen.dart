import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:togather/constant.dart';
import 'package:togather/domain/nav_bar_controller.dart';
import 'package:togather/screen/main_screen.dart';
import 'package:togather/screen/news_letter_main_screen.dart';
import 'package:togather/screen/promotion_main_screen.dart';
import 'package:togather/screen/recruit_main_screen.dart';

class NavigationLayoutScreen extends StatefulWidget {
  const NavigationLayoutScreen({Key? key}) : super(key: key);

  @override
  State<NavigationLayoutScreen> createState() => _NavigationLayoutScreenState();
}

class _NavigationLayoutScreenState extends State<NavigationLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller =
        PersistentTabController(initialIndex: 0);

    @override
    void initState() {
      super.initState();
    }

    List<Widget> _buildScreens() => [
          const MainScreen(),
          const PromotionMainScreen(),
          const RecruitMainScreen(),
          const NewsLetterMainScreen(),
        ];

    List<PersistentBottomNavBarItem> _navBarsItems() => [
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            title: "홈",
            activeColorPrimary: Theme.of(context).primaryColor,
            inactiveColorPrimary: const Color(0xffAEAEAE),
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.access_time_outlined),
            title: "홍보",
            activeColorPrimary: Theme.of(context).primaryColor,
            inactiveColorPrimary: const Color(0xffAEAEAE),
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.perm_contact_cal),
            title: "모집",
            activeColorPrimary: Theme.of(context).primaryColor,
            inactiveColorPrimary: const Color(0xffAEAEAE),
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.post_add),
            title: "뉴스레터",
            activeColorPrimary: Theme.of(context).primaryColor,
            inactiveColorPrimary: const Color(0xffAEAEAE),
          ),
        ];

    return GetBuilder<NavBarController>(
      builder: (_) => PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        hideNavigationBar: _.hideNavBar,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            defaultShadow,
          ],
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style6, // Choose the nav bar style with this property.
      ),
    );
  }
}
