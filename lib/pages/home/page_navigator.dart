import 'dart:developer';

import 'package:flutter/material.dart';

class PageNavigator extends StatefulWidget {
  const PageNavigator({
    Key? key,
    required this.navigatorKey,
    required this.child }) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;
  final Widget child;

  @override
  State<PageNavigator> createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          maintainState: false,
          settings: settings,
          builder: (_) => widget.child
        );
      },
    );
  }
}