import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scotiabank_clone/helpers/helpers.dart';
import 'package:flutter_scotiabank_clone/pages/bills/bills_page.dart';
import 'package:flutter_scotiabank_clone/pages/front/front_page.dart';
import 'package:flutter_scotiabank_clone/pages/home/page_navigator.dart';
import 'package:flutter_scotiabank_clone/pages/more/more_page.dart';
import 'package:flutter_scotiabank_clone/pages/transfers/transfers_page.dart';

class NavigationItem {
  final IconData icon;
  final String label;

  NavigationItem({required this.label, required this.icon});
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List<NavigationItem> get navigationItems => [
    NavigationItem(label: "Home", icon: Icons.home),
    NavigationItem(label: "Transfers", icon: CupertinoIcons.arrow_2_circlepath),
    NavigationItem(label: "Bills", icon: Icons.file_copy_outlined),
    NavigationItem(label: "More", icon: Icons.density_medium),
  ];

  final List<GlobalKey<NavigatorState>> navigatorStates = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  int _currentIndex = 0;


  // Offstage _page(Widget page, int index) {
  //   return Offstage(
  //     offstage:
  //      _currentIndex != index,
  //     child: ,
  //   );
  // }

  @override
  Widget build(BuildContext context) {

    final List<Widget> pages = [
      FrontPage(parentContext: context),
      TransfersPage(parentContext: context),
      BillsPage(parentContext: context),
      MorePage(parentContext: context)
    ];

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Helpers.appColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light
      ),
      child: SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: pages.asMap().map((index, page) {
              return MapEntry(
                index, 
                PageNavigator(
                  navigatorKey: navigatorStates.elementAt(index), 
                  child: page,
                )
              );
            }).values.toList()
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 10.0,
            unselectedFontSize: 10.0,
            selectedItemColor: Helpers.appColor,
            unselectedItemColor: Colors.black,
            items: navigationItems.map((item) {
              return BottomNavigationBarItem(
                icon: Icon(
                  item.icon,
                  size: 24.0,
                ),
                label: item.label
              );
            }).toList(),
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });

              for (var navigatorState in navigatorStates) {
                navigatorState.currentState?.popUntil((route) => route.isFirst);
              }
            },
          )
        ),
      ),
    );
  }
}
