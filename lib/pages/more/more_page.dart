import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scotiabank_clone/helpers/helpers.dart';
import 'package:flutter_scotiabank_clone/pages/login/login_page.dart';
import 'package:flutter_scotiabank_clone/widgets/custom_sliver_persistent%5C_header_delegate.dart';
import 'package:flutter_scotiabank_clone/widgets/scotiabank_widgets.dart';

class ListItem {
  final IconData leading;
  final Color leadingColor;
  final String label;
  final VoidCallback onTap;

  const ListItem({
    required this.leading,
    required this.leadingColor,
    required this.label,
    required this.onTap
  });
}

class MorePage extends StatefulWidget {
  const MorePage({ 
    Key? key,
    required this.parentContext }) : super(key: key);

  final BuildContext parentContext;

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {

  List<ListItem> listItems = [
    ListItem(
      leading: CupertinoIcons.settings,
      leadingColor: Colors.purple,
      label: "Profile and settings", 
      onTap: (){}
    ),
    ListItem(
      leading: CupertinoIcons.lock,
      leadingColor: Colors.blue,
      label: "Security and privacy", 
      onTap: (){}
    ),
    ListItem(
      leading: CupertinoIcons.shopping_cart,
      leadingColor: Colors.red,
      label: "Products and services", 
      onTap: (){}
    ),
    ListItem(
      leading: CupertinoIcons.star,
      leadingColor: Colors.yellow,
      label: "Get to know the app", 
      onTap: (){}
    ),
    ListItem(
      leading: Icons.chat_outlined,
      leadingColor: Colors.purple,
      label: "Contact us", 
      onTap: (){}
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScotiabankAppBar(
        backgroundColor: Colors.white,
        leadingImg: "assets/images/scotiabank_logo_red.png",
        titleLabel: "More",
        trailingIcon: Icons.help_outline
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...listItems.asMap().map((index, value) {
              final ListItem listItem = listItems.elementAt(index);

              return MapEntry(index, ScotiabankListItem(
                  allowBoxShadow: false,
                  padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 18.0),
                  leading: Icon(
                    listItem.leading,
                    color: listItem.leadingColor,
                    size: 20.0
                  ),
                  title: Text(
                    listItem.label,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  trailing: const Icon(
                    CupertinoIcons.chevron_right,
                    color: Colors.blueGrey,
                    size: 20.0
                  )
                )
              );
            }).values.toList(),
            const SizedBox(height: 36.0),
            ScotiabankButton(
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              borderRadius: BorderRadius.circular(8.0),
              text: "Sign out",
              onTap: () => Navigator.of(context).pushNamed(LoginPage.id),
            )
          ],
        ),
      )
    );
  }
}