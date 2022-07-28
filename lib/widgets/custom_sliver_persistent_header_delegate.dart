import 'package:flutter/material.dart';
import "dart:math" as math;

class CustomSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  CustomSliverPersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  }) : super();

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;  @override
  double get maxExtent => math.max(maxHeight, minHeight);  @override
  Widget build(
      BuildContext context, 
      double shrinkOffset, 
      bool overlapsContent) 
  {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(CustomSliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }

}