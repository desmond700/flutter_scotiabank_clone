import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scotiabank_clone/widgets/scotiabank_widgets.dart';

class MyUpdatesPage extends StatefulWidget {
  const MyUpdatesPage({ Key? key }) : super(key: key);

  @override
  State<MyUpdatesPage> createState() => _MyUpdatesPageState();
}

class _MyUpdatesPageState extends State<MyUpdatesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
        children: [
          ScotiabankListItem(
            title: Text(
              "Recent statements",
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 15.0,
                fontWeight: FontWeight.w700
              ),
            ),
            subTrailing: const NewIndicator(),
            trailing: const Icon(
              CupertinoIcons.chevron_down,
              color: Color.fromARGB(255, 22, 95, 124),
              size: 20,
            ),
            subTrailingGap: 20,
          ),
          const SizedBox(height: 15),
          ScotiabankListItem(
            title: Text(
              "TransUnion Credit Score",
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 15.0,
                fontWeight: FontWeight.w700
              ),
            ),
            trailing: const Icon(
              CupertinoIcons.chevron_right,
              color: Color.fromARGB(255, 22, 95, 124),
              size: 20,
            ),
          ),
          const SizedBox(height: 15),
          ScotiabankListContainer(
            padding: const EdgeInsets.only(top: 30, left: 18, right: 18, bottom: 30),
            allowHeaderDivider: false,
            header: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Updates",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Icon(
                  Icons.info_outline,
                  color: Color.fromARGB(255, 22, 95, 124),
                  size: 24,
                )
              ],
            ),
            items: [],
            placeholder: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                "You have no updates",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}