import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scotiabank_clone/helpers/helpers.dart';
import 'package:flutter_scotiabank_clone/pages/bills/bills_page.dart';
import 'package:flutter_scotiabank_clone/pages/front/front_page.dart';
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

  List<Widget> get pages => [
    FrontPage(),
    TransfersPage(),
    BillsPage(),
    MorePage()
  ];

  List<NavigationItem> get navigationItems => [
    NavigationItem(label: "Home", icon: Icons.home),
    NavigationItem(label: "Transfers", icon: CupertinoIcons.arrow_2_circlepath),
    NavigationItem(label: "Bills", icon: Icons.file_copy_outlined),
    NavigationItem(label: "More", icon: Icons.density_medium),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Helpers.appColor,
        statusBarBrightness: Brightness.light
      ),
      child: SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: pages.map((page) => page).toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 10.0,
            unselectedFontSize: 10.0,
            selectedItemColor: Helpers.appColor,
            unselectedItemColor: Colors.black,
            items: navigationItems.map((item) => BottomNavigationBarItem(
              icon: Icon(
                item.icon,
                size: 24.0,
              ),
              label: item.label
            )).toList(),
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          )
        ),
      ),
    );
  }
}
