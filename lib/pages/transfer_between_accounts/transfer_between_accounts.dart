import 'package:flutter/material.dart';
import 'package:flutter_scotiabank_clone/pages/e-transfer/e_transfer_page.dart';
import 'package:flutter_scotiabank_clone/widgets/scotiabank_widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TransferBetweenAccounts extends StatefulWidget {
  const TransferBetweenAccounts({
    Key? key, 
    required this.parentContext }) : super(key: key);

  static const String id = "/transfer-between-accounts";
  final BuildContext parentContext;

  @override
  State<TransferBetweenAccounts> createState() => _TransferBetweenAccountsState();
}

class _TransferBetweenAccountsState extends State<TransferBetweenAccounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ScotiabankListContainer(
          allowBoxShadow: false,
          allowListDivider: false,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          padding: const EdgeInsets.all(10.0),
          border: Border.all(color: Colors.grey.shade300),
          items: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Transfer between accounts",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Image.asset(
                    "assets/images/scotiabank_check.png",
                    height: 50.0,
                    width: 50.0,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Your transfer was accepted!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  ScotiabankListItem(
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10.0),
                    leading: Image.asset(
                      "assets/images/scotiabank_folder.png",
                      height: 30.0,
                      width: 30.0,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      "Reference number:",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 14.0
                      ),
                    ),
                    secondaryTitle: const Text(
                      "H44443312",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ]
              ),
            ),
            ScotiabankListContainer(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              allowBoxShadow: false,
              border: Border.all(style: BorderStyle.none),
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              items: [
                ScotiabankListItem(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  allowBoxShadow: false,
                  title: Text(
                    "From",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  secondaryTitle: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Money Master ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        TextSpan(
                          text: "(4321)",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400
                          ),
                        )
                      ]
                    )
                  ),
                  tertiaryTitle: Text(
                    "\$15,543.67",
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                ScotiabankListItem(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  allowBoxShadow: false,
                  title: Text(
                    "To",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  secondaryTitle: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Basic Banking ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        TextSpan(
                          text: "(3566)",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400
                          ),
                        )
                      ]
                    )
                  ),
                  tertiaryTitle: Text(
                    "\$7,532.87",
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ScotiabankListItem(
                        allowBoxShadow: false,
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        title: Text(
                          "Amount",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        secondaryTitle: Text(
                          "\$100.00",
                          style: TextStyle(
                            color: Colors.grey.shade900,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400
                          ),
                        )
                      ),
                    ),
                    Expanded(
                      child: ScotiabankListItem(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                        border: Border(left: BorderSide(color: Colors.grey.shade300)),
                        allowBoxShadow: false,
                        title: Text(
                          "Date",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        secondaryTitle: Text(
                          "July, 20, 2022",
                          style: TextStyle(
                            color: Colors.grey.shade900,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400
                          ),
                        )
                      ),
                    )
                  ],
                ),
              ]
            ),
            ScotiabankButton(
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              borderRadius: BorderRadius.circular(8.0),
              text: "Make another transfer",
              onTap: () => Navigator.of(widget.parentContext).push(
                MaterialPageRoute(builder: (_) => ETransferPage(
                    baseContext: context, 
                    mainNavigatorContext: widget.parentContext,
                  )
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}