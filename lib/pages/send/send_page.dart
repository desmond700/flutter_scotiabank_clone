import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scotiabank_clone/pages/transfer_between_accounts/transfer_between_accounts.dart';
import 'package:flutter_scotiabank_clone/widgets/scotiabank_widgets.dart';

class SendPage extends StatefulWidget {
  const SendPage({ 
    Key? key,
    required this.baseContext,
    required this.mainNavigatorContext }) : super(key: key);

  final BuildContext baseContext;
  final BuildContext mainNavigatorContext;

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
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
                    "From",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  subtitle: Text(
                    "Select account",
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
                    "To",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  subtitle: Text(
                    "Select contacts",
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
                )
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ScotiabankSlider(
                label: "Slide to transfer",
                onSliderEnd: () {
                  Navigator.of(context).pop();
                  Navigator.of(widget.baseContext).push(
                    MaterialPageRoute(
                      builder: (_) => TransferBetweenAccounts(parentContext: widget.mainNavigatorContext)
                    )
                  );
                }
              ),
            )
          )
        ]
      )
    );
  }
}