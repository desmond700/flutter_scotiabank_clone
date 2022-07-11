import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({ Key? key }) : super(key: key);

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
            horizontalTitleGap: 8.0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(5.0)
            ),
            leading: Icon(
              Icons.account_box_outlined,
              color: Colors.grey.shade600,
              size: 30.0
            ),
            title: Text(
              "Manage contacts",
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 16.0,
                fontWeight: FontWeight.w600
              ),
            ),
            trailing: const Icon(
              CupertinoIcons.chevron_right,
              color: Colors.blue,
            )
          ),
          const SizedBox(height: 40.0),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "No activity",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 18.0),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400
                  ),
                  children: const [
                    TextSpan(
                      text: "You don't have any pending ",
                    ),
                    TextSpan(
                      text: " interac ",
                      style: TextStyle(
                        fontStyle: FontStyle.italic
                      ),
                    ),
                    TextSpan(
                      text: "\ne-Transfers or history."
                    )
                  ]
                )
              )
            ],
          )
        ]
      ),
    );
  }
}