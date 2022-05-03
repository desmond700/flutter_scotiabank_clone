import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scotiabank_clone/widgets/custom_sliver_persistent%5C_header_delegate.dart';
import 'package:flutter_scotiabank_clone/widgets/scotiabank_widgets.dart';

class TransfersPage extends StatefulWidget {
  const TransfersPage({ Key? key }) : super(key: key);

  @override
  State<TransfersPage> createState() => _TransfersPageState();
}

class _TransfersPageState extends State<TransfersPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: CustomSliverPersistentHeaderDelegate(
            maxHeight: 74, 
            minHeight: 74,
            child: ScotiabankAppBar(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              backgroundColor: Colors.white,
              // height: 130.0,
              // border: Border(
              //   bottom: BorderSide(color: Colors.grey.shade300)
              // ),
              leading: Image.asset(
                "assets/images/scotiabank_logo_red.png",
                height: 42.0,
                width: 42.0,
                fit: BoxFit.contain,
              ),
              title: const Text(
                "Transfers",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              actions: [
                IconButton(
                    onPressed: (){}, 
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.help_outline,
                      color: Colors.black,
                      size: 32.0,
                    )
                  )
              ] 
            )
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                ScotiabankListContainer(
                  padding: const EdgeInsets.only(top: 18.0, left: 18.0, bottom: 8.0),
                  allowHeaderDivider: false,
                  header: Text(
                    "WITHIN CANADA",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  items: [
                    ScotiabankListItem(
                      allowBoxShadow: false,
                      padding: const EdgeInsets.only(top: 18.0, right: 18.0, bottom: 18.0),
                      verticalPosition: CrossAxisAlignment.start,
                      border: Border.all(style: BorderStyle.none),
                      leading: const Icon(
                        CupertinoIcons.arrow_2_squarepath,
                        color: Colors.black
                      ),
                      title: const Text(
                        "Transfer between accounts",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      secondaryTitle: Text(
                        "Pay you credit card or transfer money between your Scotiabank accounts.",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15
                        ),
                      ),
                    ),
                    ScotiabankListItem(
                      allowBoxShadow: false,
                      padding: const EdgeInsets.only(top: 18.0, right: 18.0, bottom: 18.0,),
                      verticalPosition: CrossAxisAlignment.start,
                      border: Border.all(style: BorderStyle.none),
                      leading: const Icon(
                        Icons.square_outlined,
                        color: Colors.black
                      ),
                      title: const Text(
                        "Interac e-Transfer",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                        )
                      ),
                      secondaryTitle: Text(
                        "Send and request money or manage your pending interac e-Transfer and history.",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15
                        )
                      )
                    ),
                    ScotiabankListItem(
                      allowBoxShadow: false,
                      padding: const EdgeInsets.only(top: 18.0, right: 18.0, bottom: 18.0,),
                      verticalPosition: CrossAxisAlignment.start,
                      border: Border.all(style: BorderStyle.none),
                      leading: const Icon(
                        Icons.message,
                        color: Colors.black
                      ),
                      title: const Text(
                        "Deposit a cheque",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      secondaryTitle: Text(
                        "Take a picture of your cheque to deposit money to your account.",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15
                        )
                      )
                    )
                  ]
                ),
                const SizedBox(height: 20),
                ScotiabankListContainer(
                  padding: const EdgeInsets.only(top: 18.0, left: 18.0, bottom: 8.0),
                  allowHeaderDivider: false,
                  header: Text(
                    "INTERNATIONAL",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  items: [
                    ScotiabankListItem(
                      allowBoxShadow: false,
                      padding: const EdgeInsets.only(top: 18.0, right: 18.0, bottom: 18.0),
                      verticalPosition: CrossAxisAlignment.start,
                      border: Border.all(style: BorderStyle.none),
                      leading: const Icon(
                        CupertinoIcons.paperplane,
                        color: Color.fromARGB(255, 11, 37, 12)
                      ),
                      title: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Banks deposit ",
                              style: TextStyle(
                                inherit: false,
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: NewIndicator()
                            )
                          ]
                        )
                      ),
                      secondaryTitle: Text(
                        "Send money directly to a bank account with Scotia International Money Transfer.",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15
                        ),
                      ),
                      tertiaryTitle: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Delivery estimate ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            TextSpan(
                              text: "up to 5 business days",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                              ),
                            )
                          ]
                        )
                      )
                    ),
                    ScotiabankListItem(
                      allowBoxShadow: false,
                      padding: const EdgeInsets.only(top: 18.0, right: 18.0, bottom: 18.0,),
                      verticalPosition: CrossAxisAlignment.start,
                      border: Border.all(style: BorderStyle.none),
                      leading: const Icon(
                        Icons.square,
                        color: Colors.black
                      ),
                      title: const Text(
                        "Cash pickup",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                        )
                      ),
                      secondaryTitle: Text(
                        "Send money to an agent location with Western Union.",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15
                        )
                      ),
                      tertiaryTitle: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Delivery estimate ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            TextSpan(
                              text: "2-4 hours ",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(
                                Icons.info_outline,
                                color: Color.fromARGB(255, 30, 135, 177),
                              )
                            )
                          ]
                        )
                      ),
                    )
                  ]
                )
              ]
            )
          ),
        )
      ],
    );
  }
}