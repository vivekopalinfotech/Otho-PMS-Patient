// ignore_for_file: use_build_context_synchronously, prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortho_pms_patient/app_color/app_colors.dart';
import 'package:ortho_pms_patient/screens/dashboard.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'app_constants/app_constants.dart';


class MainScreen extends StatefulWidget {
  final String redirectPageName;

  const MainScreen({
    Key? key,
    required this.redirectPageName,

  });

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;
  late bool _hideNavBar;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    if (widget.redirectPageName == "dashboardPage") {
      _controller = PersistentTabController(initialIndex: 0);
    } else if (widget.redirectPageName == "schedulePage") {
      _controller = PersistentTabController(initialIndex: 1);
    } else if (widget.redirectPageName == "patientPage") {
      _controller = PersistentTabController(initialIndex: 2);
    }
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      const Dashboard(),
      const SizedBox(),
      const SizedBox(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.25);
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.medical_services_outlined),

        iconSize: 26,
        title: 'Patient',
        textStyle: GoogleFonts.inter(fontSize: AppConstants.SMALL, fontWeight: FontWeight.w600, color: AppColor.blackColor),
        activeColorPrimary: colorScheme.surfaceTint,
        inactiveColorPrimary:evenItemColor,
        contentPadding: 0,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/dashboard': (context) => const Dashboard(),
            '/schedule': (context) => const SizedBox(),
            '/patients': (context) => const SizedBox()
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.history),
        iconSize: 26,
        title: 'Appt History',
        textStyle: GoogleFonts.inter(fontSize: AppConstants.SMALL, fontWeight: FontWeight.w600, color: AppColor.blackColor),
        activeColorPrimary:  colorScheme.surfaceTint,
        inactiveColorPrimary:evenItemColor,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/dashboard': (context) => const Dashboard(),
            '/schedule': (context) => const SizedBox(),
            '/patients': (context) => const SizedBox()
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.payment),
        iconSize: 26,
        title: 'Payment',
        activeColorPrimary:  colorScheme.surfaceTint,
        inactiveColorPrimary:evenItemColor,
        textStyle: GoogleFonts.inter(fontSize: AppConstants.SMALL, fontWeight: FontWeight.w600, color: AppColor.blackColor),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/dashboard': (context) => const Dashboard(),
            '/schedule': (context) => const SizedBox(),
            '/patients': (context) => const SizedBox()
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
        body: PersistentTabView(context,
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: colorScheme.surface,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,

            hideNavigationBarWhenKeyboardShows: true,
            popActionScreens: PopActionScreensType.all,
           onItemSelected: (index) {
              if (index == 0) {}
              if (index == 1) {
                //   showAlertDialog(context);
              }
              if (index == 2) {}
            },
            selectedTabScreenContext: (context) {},

            popAllScreensOnTapAnyTabs: true,
            navBarHeight: 65,
            hideNavigationBar: _hideNavBar,
            popAllScreensOnTapOfSelectedTab: true,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeIn,
            ),
            padding: const NavBarPadding.symmetric(vertical: 8,horizontal: 0),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style8));
  }
}

void showAlertDialog(BuildContext context) {
  final ColorScheme colorScheme = Theme.of(context).colorScheme;

  Widget cancelButton = TextButton(
    child: Text(
      "Cancel",
      textScaler: const TextScaler.linear(1),
      style: TextStyle(color: colorScheme.primary),
    ),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text("Exit", textScaler: const TextScaler.linear(1), style: TextStyle(color: colorScheme.primary)),
    onPressed: () async {
      Navigator.of(context, rootNavigator: true).pop();
      SystemNavigator.pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
    backgroundColor: AppColor.whiteColor,
    titlePadding: EdgeInsets.zero,
    contentPadding: EdgeInsets.zero,
    title: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColor.whiteColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.HP, vertical: AppConstants.VP),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                "assets/images/logo.png",
                height: 40,
              )),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Are you sure want to exit from the application?",
            textScaler: const TextScaler.linear(1),
            style: GoogleFonts.lato(color: AppColor.blackColor, fontSize: AppConstants.LARGE, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              cancelButton,
              continueButton,
            ],
          ),
        ],
      ),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
