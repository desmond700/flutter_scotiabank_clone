import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scotiabank_clone/helpers/helpers.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
  ScotiabankListContainer({ 
    Key? key,
    ValueNotifier<ScotiabankDropdownToggleValue>? showNotifier,
    this.padding = const EdgeInsets.only(left: 18.0),
    this.margin,
    this.backgroundColor = Colors.white,
    this.header,
    this.allowHeaderDivider = true,
    this.allowListDivider = true,
    this.placeholder,
    this.border,
    this.borderRadius,
    this.allowBoxShadow = true,
    required this.items, 
    this.exceptions = const [] }) : showNotifier = showNotifier ?? ValueNotifier(ScotiabankDropdownToggleValue(key: key, show: true)),
                                    super(key: key);

  final ValueNotifier<ScotiabankDropdownToggleValue> showNotifier;
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final Widget? header;
  final bool allowHeaderDivider;
  final bool allowListDivider;
  final bool allowBoxShadow;
  final List<Widget> items;
  final Widget? placeholder;
  final BoxBorder? border;
  final BorderRadius? borderRadius;

  /// The [exceptions] list holds the keys of the children ScotiabankDropdownList
  /// to prevent the [ScotiabankListContainer] from disappearing when the 
  /// ScotiabankDropdownList's list items are toggled.
  final List<Key> exceptions;

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable: showNotifier,
      builder: (context, ScotiabankDropdownToggleValue value, Widget? child) {
        bool visible = value.show;
        if (exceptions.contains(value.key)) {
          log("ScotiabankListContainer exceptions ${value.key}");
          visible = true;
        }
        return Visibility(
          visible: visible,
          child: child!
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: margin,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (header != null) header!,
            if (allowHeaderDivider && header != null) const _ListDivider(),
            
            if (items.isNotEmpty)
              ...items.fold<List<Widget>>(List.empty(growable: true), (previousValue, element) {
                if (previousValue.isNotEmpty) {
                  if (allowListDivider) {
                    previousValue.add(const _ListDivider());
                  }
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
      height: 1,
      thickness: 1, 
      color: Colors.grey.shade300
    );
  }
}

class ScotiabankListItem extends StatelessWidget {
  ScotiabankListItem({ 
    Key? key,
    ValueNotifier<ScotiabankDropdownToggleValue>? showNotifier,
    this.leading,
    this.padding = const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
    this.margin = EdgeInsets.zero,
    this.verticalPosition = CrossAxisAlignment.center,
    this.backgroundColor = Colors.white,
    this.allowBoxShadow = true,
    required this.title,
    this.secondaryTitle,
    this.tertiaryTitle,
    this.subTrailing,
    this.trailing,
    this.onTap,
    this.secondaryTitleGap = 10,
    this.tertiaryTitleGap = 10,
    this.subTrailingGap = 10,
    this.border,
    this.borderRadius }) :  showNotifier = showNotifier ?? ValueNotifier(ScotiabankDropdownToggleValue(key: key, show: true)),
                            super(key: key);

  final ValueNotifier<ScotiabankDropdownToggleValue> showNotifier;
  final EdgeInsets padding;
  final EdgeInsets margin;
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
  final VoidCallback? onTap;
  // final int horizontalGap = 0;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: showNotifier,
      builder: (context,ScotiabankDropdownToggleValue value, Widget? child) {
        
        bool visible = value.show;

        return Visibility(
          visible: visible,
          child: child!
        );
      },
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: padding,
          margin: margin,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: border,
            borderRadius: borderRadius,
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
              Align(
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
              )
            ],
          )
        ),
      ),
    );
  }
}

class ScotiabankPageNotification extends StatelessWidget {
  ScotiabankPageNotification({
    Key? key,
    ValueNotifier<ScotiabankDropdownToggleValue>? showNotifier,
    required this.textItems }) :  showNotifier = showNotifier ?? ValueNotifier(ScotiabankDropdownToggleValue(key: key, show: true)),
                                  super(key: key);

  final List<TextSpan> textItems;
  final ValueNotifier<ScotiabankDropdownToggleValue> showNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: showNotifier,
      builder: (context, ScotiabankDropdownToggleValue value, Widget? child) {
        bool visible = value.show;
        
        return Visibility(
          visible: visible,
          child: child!
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              MdiIcons.bullhornOutline,
              color: Colors.red,
              size: 38,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RichText(
                  text: TextSpan(
                    children: textItems
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _PreferredAppBarSize extends Size {
  const _PreferredAppBarSize(this.appbarHeight, this.bottomHeight)
    : super.fromHeight((appbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? appbarHeight;
  final double? bottomHeight;
}

class ScotiabankAppBar extends StatefulWidget implements PreferredSizeWidget {
  ScotiabankAppBar({ 
    Key? key,
    this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
    this.allowNavigatorPop = false,
    this.backgroundColor = Colors.white,
    this.height,
    this.border,
    required this.titleLabel,
    this.leadingImg,
    this.trailingIcon,
    this.bottomHorizontalPadding = 0,
    this.bottom }) : /* assert(leadingImg != null && allowNavigatorPop),*/
                      preferredSize = _PreferredAppBarSize(height, bottom?.preferredSize.height),
                      super(key: key);

  final EdgeInsets padding;
  final double? height;
  final Color backgroundColor;
  final Border? border;
  final String? leadingImg;
  final bool allowNavigatorPop;
  final String titleLabel;
  final IconData? trailingIcon;
  final PreferredSizeWidget? bottom;
  final double? bottomHorizontalPadding;

  @override
  final Size preferredSize;

  @override
  State<ScotiabankAppBar> createState() => _ScotiabankAppBarState();
}

class _ScotiabankAppBarState extends State<ScotiabankAppBar> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      // height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: widget.border ?? Border(
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
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.allowNavigatorPop)
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      CupertinoIcons.arrow_left,
                      color: Colors.black,
                      size: 26.0,
                    ),
                  )
                else if (widget.leadingImg != null) 
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      widget.leadingImg!, //"assets/images/scotiabank_logo_red.png",
                      height: 38.0,
                      width: 38.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                Text(
                  widget.titleLabel,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                if (widget.trailingIcon != null)
                  IconButton(
                    // padding: const EdgeInsets.all(10.0),
                    onPressed: (){},
                    icon: Icon(
                      widget.trailingIcon,
                      color: Colors.black,
                      size: 26.0,
                    )
                  ),
              ],
            ),
          ),
          if (widget.bottom != null) 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: widget.bottom!,
            )
        ],
      ),
    );
  }
}

class ScotiabankButton extends StatelessWidget {
  const ScotiabankButton({
    Key? key,
    this.height = 55.0,
    this.margin,
    required this.text,
    this.backgroundColor = Colors.white,
    this.textColor = Helpers.appColor,
    this.borderRadius = BorderRadius.zero,
    this.onTap }) : super(key: key);

  final double height;
  final EdgeInsets? margin;
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final BorderRadiusGeometry borderRadius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      height: height,
      child: TextButton(
        onPressed: onTap, 
        style: TextButton.styleFrom(
          alignment: Alignment.center,
          side: const BorderSide(color: Helpers.appColor),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius
          )
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 15.0,
            fontWeight: FontWeight.w500
          ),
        )
      ),
    );
  }
}

class ScotiabankSlider extends StatefulWidget {
  const ScotiabankSlider({
    Key? key,
    this.sliderColor = Helpers.appColor,
    this.sliderContentColor = Colors.white,
    this.label,
    this.onSliderEnd }) : super(key: key);

  final Color sliderColor;
  final Color sliderContentColor;
  final String? label;
  final VoidCallback? onSliderEnd;

  @override
  State<ScotiabankSlider> createState() => _ScotiabankSliderState();
}

class _ScotiabankSliderState extends State<ScotiabankSlider> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _sliderHeightAnimation;
  final double sliderWidth = 70.0;
  final double sliderHeight = 60.0;

  @override
  void initState() {
    Duration duration = const Duration(milliseconds: 300);
    _controller = AnimationController(vsync: this, duration: duration);
    // _sliderHeightAnimation = Tween<double>(begin: )
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sliderHeight,
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          log("LayoutBuilder maxWidth: ${constraints.maxWidth}");
          double maxWidth = constraints.maxWidth - sliderWidth;

          return Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Positioned.fill(
                child: Container(
                  height: sliderHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(30.0)
                  )
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: sliderWidth / 2),
                  child: Text(
                    widget.label ?? "",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  if (details.primaryDelta == null) return;

                  double delta = details.primaryDelta! / maxWidth;
                  _controller.value += delta;
                },
                onHorizontalDragEnd: (DragEndDetails details) {
                  // const delta = details.velocity.pixelsPerSecond.dx
                  double dragDistance = _controller.value;
                  log("DragEndDetails value: ${_controller.value}");

                  if (dragDistance > 0.50) {
                    _controller.forward().then((value) {
                      if (widget.onSliderEnd == null) return;
                      widget.onSliderEnd!();
                    });
                  }
                  else {
                    _controller.reverse();
                  }
                },
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    log("_controller.value ${_controller.value}");
                    double animValue = _controller.value;
                    double width = (_controller.value * maxWidth) + sliderWidth;

                    return Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(left: 15.0, right: 20.0),
                      height: sliderHeight,
                      width: width,
                      decoration: BoxDecoration(
                        color: widget.sliderColor,
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Visibility(
                            visible: animValue >= 0.75,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Text(
                                widget.label ?? "",
                                style: TextStyle(
                                  color: widget.sliderContentColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                          Icon(
                            CupertinoIcons.arrow_right,
                            color: widget.sliderContentColor,
                            size: 28.0,
                          ),
                        ],
                      )
                    );
                  }
                ),
              )
            ],
          );
        }
      ),
    );
  }
}


class ScotiabankDropdownToggleValue {
  final Key? key;
  final bool show;

  const ScotiabankDropdownToggleValue({
    required this.key, 
    required this.show
  });
}

class ScotiabankDropListItemValue {
  final String label;
  final String value;

  const ScotiabankDropListItemValue({
    required this.label, 
    required this.value
  });
}

class ScotiabankDropdownList extends StatefulWidget {
  ScotiabankDropdownList({
    Key? key,
    ValueNotifier<ScotiabankDropdownToggleValue>? showNotifier,
    this.leading,
    this.containerPadding = const EdgeInsets.only(left: 18.0),
    this.headerPadding = EdgeInsets.zero,
    this.listItemPadding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.verticalPosition = CrossAxisAlignment.center,
    this.backgroundColor = Colors.white,
    this.allowBoxShadow = true,
    required this.headerTitle,
    this.headerSecondaryTitle,
    this.headerTertiaryTitle,
    this.subTrailing,
    this.trailing,
    this.onTap,
    this.secondaryTitleGap = 10,
    this.tertiaryTitleGap = 10,
    this.subTrailingGap = 10,
    this.border,
    this.borderRadius,
    required this.items,
    this.onValueChange, 
    this.itemTextStyle, 
    this.onToggleList }) : showNotifier = showNotifier ?? ValueNotifier(ScotiabankDropdownToggleValue(key: key, show: true)),
                           super(key: key);

  final ValueNotifier<ScotiabankDropdownToggleValue> showNotifier;
  final EdgeInsets containerPadding;
  final EdgeInsets headerPadding;
  final EdgeInsets listItemPadding;
  final EdgeInsets margin;
  final Color? backgroundColor;
  final Widget? leading;
  final Widget headerTitle;
  final Widget? headerSecondaryTitle;
  final Widget? headerTertiaryTitle;
  final TextStyle? itemTextStyle;
  final Widget? trailing;
  final Widget? subTrailing;
  final double secondaryTitleGap;
  final double tertiaryTitleGap;
  final double subTrailingGap;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final bool allowBoxShadow;
  final List<ScotiabankDropListItemValue> items;
  final CrossAxisAlignment verticalPosition;
  final VoidCallback? onTap;
  final Function(int index, ScotiabankDropListItemValue value)? onValueChange;
  final Function(ScotiabankDropdownToggleValue value)? onToggleList;

  @override
  State<ScotiabankDropdownList> createState() => _ScotiabankDropdownListState();
}

class _ScotiabankDropdownListState extends State<ScotiabankDropdownList> {
  
  List<ScotiabankDropListItemValue> get items => widget.items;

  bool showList = false;
  int counter = 0;
  late ScotiabankDropListItemValue selectedOption;

  @override
  void initState() {
    selectedOption = (() {
      if (items.isEmpty) return const ScotiabankDropListItemValue(label: "", value: "");
      return items.first;
    })();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double appbarHeight = MediaQuery.of(context).padding.top + (kToolbarHeight * 2);
    double height = MediaQuery.of(context).size.height;
    double itemPadding = 40.0;
    double bottomNavigationHeight = 60.0;
    double screenHeight = height - appbarHeight - (itemPadding + bottomNavigationHeight);

    return ValueListenableBuilder(
      valueListenable: widget.showNotifier,
      builder: (context, ScotiabankDropdownToggleValue value, Widget? child) {
        bool visible = (() {
          if (widget.key == null || value.key == null) return true;
          return value.key == widget.key ? true : value.show;
        })();

        return Visibility(
          visible: visible,
          child: child!
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        padding: widget.containerPadding,
        margin: widget.margin,
        height: showList ? screenHeight : 85.0,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          border: widget.border,
          borderRadius: widget.borderRadius,
          boxShadow: [
            if (widget.allowBoxShadow)
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0, 4),
                blurRadius: 4
              )
          ]
        ),
        child: OverflowBox(
          maxHeight: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ScotiabankListItem(
                allowBoxShadow: false,
                padding: widget.headerPadding,
                borderRadius: BorderRadius.circular(10.0),
                title: widget.headerTitle,
                secondaryTitle: widget.headerSecondaryTitle,
                tertiaryTitle: widget.headerTertiaryTitle,
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Icon(
                    showList ? CupertinoIcons.chevron_up : CupertinoIcons.chevron_down,
                    color: Colors.blue
                  ),
                ),
                onTap: () {
                  setState(() {
                    showList = !showList;
                  });

                  if (widget.onToggleList != null) {
                    var toggleValue = ScotiabankDropdownToggleValue(key: widget.key, show: !showList);
                    widget.onToggleList!(toggleValue);
                  }
                },
              ),
              if (items.isNotEmpty && showList) const _ListDivider(),
              Visibility(
                visible: showList,
                child: Column(
                  children: items.fold<List<Widget>>(List.empty(growable: true), (previousValue, element) {
                    bool isSelected = element.value == selectedOption.value;

                    var listItem = ScotiabankListItem(
                      allowBoxShadow: false,
                      padding: widget.listItemPadding,
                      title: Text(
                        element.label,
                        style: widget.itemTextStyle,
                      ),
                      trailing: Icon(
                        isSelected ? CupertinoIcons.smallcircle_fill_circle_fill : CupertinoIcons.circle,
                        color: isSelected ? Colors.blue : Colors.grey.shade500,
                        size: 28.0,
                      ),
                      onTap: () {
                        if (widget.onValueChange == null) return;
                        setState(() {
                          selectedOption = element;
                        });
                        widget.onValueChange!(counter, element);
                      },
                    );
              
                    if (previousValue.isNotEmpty) {
                      previousValue.add(const _ListDivider());
                      
                      previousValue.add(listItem);
                    }
                    else {
                      previousValue.add(listItem);
                    }
              
                    counter += 1;
              
                    return previousValue;
                  }).toList()
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}