import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scotiabank_clone/widgets/scotiabank_widgets.dart';

import '../../helpers/helpers.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({ Key? key }) : super(key: key);

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, right: 14.0, bottom: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  title: Text(
                    "Request from",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  subtitle: Text(
                    "Select contact",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  trailing: const Icon(
                    CupertinoIcons.chevron_down,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 10.0),
                ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  title: Text(
                    "Deposit to",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  subtitle: Text(
                    "Select contact",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  trailing: const Icon(
                    CupertinoIcons.chevron_down,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 10.0),
                ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  title: Text(
                    "Amount",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  subtitle: Text(
                    "Enter amount",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15),
                  child: Row(
                    children:  [
                      Image.asset(
                        "assets/images/scotiabank_megaphone.png",
                        height: 28.0,
                        width: 28.0,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "A service fee may be charged to your account for this transaction. ",
                                style: TextStyle(
                                  color: Colors.grey.shade600
                                )
                              ),
                              const TextSpan(
                                text: "Learn more",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600
                                )
                              )
                            ]
                          )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ScotiabankSlider(
                label: "Slide to request",
                onSliderEnd: () {}
              ),
            )
          )
        ]
      )
    );
  }
}