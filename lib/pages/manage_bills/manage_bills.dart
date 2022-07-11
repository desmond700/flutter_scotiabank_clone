import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scotiabank_clone/widgets/scotiabank_widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ManageBillsPage extends StatefulWidget {
  const ManageBillsPage({Key? key}) : super(key: key);

  @override
  State<ManageBillsPage> createState() => _ManageBillsPageState();
}

class _ManageBillsPageState extends State<ManageBillsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        children: [
          ScotiabankListItem(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10.0),
            leading: const Icon(
              Icons.money,
              color: Colors.green,
            ),
            title: const Text(
              "Manage payees",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w500
              ),
            ),
            trailing: const Icon(
              CupertinoIcons.chevron_right,
              color: Colors.blue,
              size: 20.0,
            )
          ),
          const SizedBox(height: 15.0),
          ScotiabankListItem(
            subTrailingGap: 0,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10.0),
            leading: const Icon(
              Icons.money,
              color: Colors.green,
            ),
            title: const Text(
              "Switch my bills to Scotia",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w500
              ),
            ),
            trailing: const Icon(
              CupertinoIcons.chevron_right,
              color: Colors.blue,
              size: 20.0,
            )
          ),
          const SizedBox(height: 25.0,),
          ScotiabankListContainer(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            allowListDivider: false,
            items: [
              Text(
                "No scheduled payments",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Try adding a sceduled payment",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  Icon(
                    MdiIcons.folderOutline,
                    color: Colors.grey.shade200,
                    size: 50.0,
                  )
                ],
              ),
            ]
          ),
          const SizedBox(height: 15.0),
          ScotiabankListContainer(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            allowListDivider: false,
            items: [
              Text(
                "PAYMENT HISTORY",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(12.0),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey.shade500),
                          borderRadius: BorderRadius.circular(10.0)
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            CupertinoIcons.calendar,
                            color: Colors.grey.shade800,
                            size: 28.0
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            "Last 90 Days",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          const SizedBox(width: 30.0),
                          Icon(
                            CupertinoIcons.chevron_down,
                            color: Colors.grey.shade800,
                            size: 20.0
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 30.0,),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: TextButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                        side: BorderSide(color: Colors.grey.shade200),
                        shape: const CircleBorder()
                      ),
                      child: Icon(
                        CupertinoIcons.search,
                        color: Colors.blue.shade500,
                        size: 24.0,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30.0,),
              Text(
                "No recent activity",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "You don't have any bill payments in this period",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  Icon(
                    MdiIcons.folderOutline,
                    color: Colors.grey.shade200,
                    size: 50.0,
                  )
                ],
              ),
            ]
          )
        ],
      ),
    );
  }
}