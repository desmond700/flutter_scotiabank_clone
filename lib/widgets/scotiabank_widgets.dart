import 'dart:developer';

import 'package:flutter/material.dart';

class NewIndicator extends StatelessWidget {
  const NewIndicator({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      height: 26,
      width: 45,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 100, 13, 182),
        borderRadius: BorderRadius.circular(6)
      ),
      child: const Center(
        child: Text(
          "NEW",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w700
          ),
        ),
      )
    );
  }
}



class ScotiabankListContainer extends StatelessWidget {
  const ScotiabankListContainer({ 
    Key? key,
    this.padding = const EdgeInsets.only(left: 18.0),
    this.backgroundColor = Colors.white,
    this.header,
    this.allowHeaderDivider = true,
    this.placeholder,
    required this.items }) : super(key: key);

  final EdgeInsets padding;
  final Color? backgroundColor;
  final Widget? header;
  final bool allowHeaderDivider;
  final List<Widget> items;
  final Widget? placeholder;

  @override
  Widget build(BuildContext context) {
    log("ScotiabankListContainer items length: ${items.length}");

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0, 4),
            blurRadius: 4
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (header != null) header!,
          if (allowHeaderDivider && header != null) const _ListDivider(),
          
          if (items.isNotEmpty)
            ...items.fold<List<Widget>>(List.empty(growable: true), (previousValue, element) {
              if (previousValue.isNotEmpty) {
                previousValue.add(const _ListDivider());
                previousValue.add(element);
              }
              else {
                previousValue.add(element);
              }

              return previousValue;
            }).toList()
          else
            if (placeholder != null) placeholder!
            else
              Text(
                "No items available",
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 15.0
                ),
              )
          
        ],
      ),
    );
  }
}

class _ListDivider extends StatelessWidget {
  const _ListDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1, 
      color: Colors.grey.shade300
    );
  }
}

class ScotiabankListItem extends StatelessWidget {
  const ScotiabankListItem({ 
    Key? key,
    this.leading,
    this.padding = const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
    this.verticalPosition = CrossAxisAlignment.center,
    this.backgroundColor = Colors.white,
    this.allowBoxShadow = true,
    required this.title,
    this.secondaryTitle,
    this.tertiaryTitle,
    this.subTrailing,
    this.trailing,
    this.secondaryTitleGap = 10,
    this.tertiaryTitleGap = 10,
    this.subTrailingGap = 10,
    this.border,
    this.borderRadius }) : super(key: key);

  final EdgeInsets padding;
  final Color? backgroundColor;
  final Widget? leading;
  final Widget title;
  final Widget? secondaryTitle;
  final Widget? tertiaryTitle;
  final Widget? trailing;
  final Widget? subTrailing;
  final double secondaryTitleGap;
  final double tertiaryTitleGap;
  final double subTrailingGap;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final bool allowBoxShadow;
  final CrossAxisAlignment verticalPosition;
  // final int horizontalGap = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border ?? Border.all(color: Colors.grey.shade300),
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        boxShadow: [
          if (allowBoxShadow)
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0, 4),
            blurRadius: 4
          )
        ]
      ),
      child: Row(
        crossAxisAlignment: verticalPosition,
        children: [
          if (leading != null) 
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: leading!,
            ),

          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                title,
                if (secondaryTitle != null) 
                  Padding(
                    padding: EdgeInsets.only(top: secondaryTitleGap),
                    child: secondaryTitle!,
                  ),
                if (tertiaryTitle != null)
                  Padding(
                    padding: EdgeInsets.only(top: tertiaryTitleGap),
                    child: tertiaryTitle!,
                  )
              ],
            ),
          ),
          if (trailing != null)
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (subTrailing != null) 
                    Padding(
                      padding: EdgeInsets.only(right: subTrailingGap),
                      child: subTrailing!
                    ),
                  if (trailing != null) trailing!
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}

class ScotiabankAppBar extends StatelessWidget {
  const ScotiabankAppBar({ 
    Key? key,
    this.padding = const EdgeInsets.all(18.0),
    this.backgroundColor = Colors.white,
    this.border,
    required this.title,
    this.leading,
    this.actions = const [],
    this.bottom }) : super(key: key);

  final EdgeInsets padding;
  final Color backgroundColor;
  final Border? border;
  final Widget? leading;
  final Widget title;
  final List<Widget> actions;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border ?? Border(
          bottom: BorderSide(color: Colors.grey.shade300)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0, 4),
            blurRadius: 4
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (leading != null) leading!,
              title,
              if (actions.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: actions,
                ) 
            ],
          ),
          if (bottom != null) bottom!
        ],
      ),
    );
  }
}