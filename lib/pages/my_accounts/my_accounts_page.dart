import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scotiabank_clone/helpers/helpers.dart';
import 'package:flutter_scotiabank_clone/widgets/scotiabank_widgets.dart';

class MyAccountsPage extends StatefulWidget {
  const MyAccountsPage({ Key? key }) : super(key: key);

  @override
  State<MyAccountsPage> createState() => _MyAccountsPageState();
}

class _MyAccountsPageState extends State<MyAccountsPage> {

  late BoxDecoration decoration;

  @override
  void initState() {
    decoration = BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          offset: const Offset(0, 4),
          blurRadius: 4
        )
      ]
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Good afternoon",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0
                        )
                      ),
                      TextSpan(
                        text: ", Desmond",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                        )
                      )
                    ]
                  )
                ),
                Image.asset(
                  "assets/images/sun-behind-cloud.png",
                  height: 24,
                  width: 24
                )
              ],
            ),
          ),
          ScotiabankListContainer(
            header: const _AccountHeader(accountCount: 2,),
            items: [
              _AccountItem(
                  accountBalance: 20433, 
                  accountName: 'Basic', 
                  accountNumber: "5156",
                  onTap: (){},
                ),
                _AccountItem(
                  accountBalance: 453231, 
                  accountName: 'Money Master', 
                  accountNumber: "5217",
                  onTap: (){}
                ),
                const _AccountTotal()
            ],
          ),
          const SizedBox(height: 30),
          const ScotiabankListItem(
            leading: Icon(
              Icons.credit_card,
              color: Colors.black,
              size: 24
            ),
            title: Text(
              "Add a new product",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700
              ),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.black,
              size: 24
            )
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              const ScotiabankListItem(
                leading: Icon(
                  Icons.local_offer,
                  color: Helpers.appColor,
                  size: 24.0,
                ),
                title: Text(
                  "Offers and programs \n(3)",
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                  ),
                ),
                subTrailing: NewIndicator(),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                  size: 24
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: DottedBorder(
                  color: Colors.grey.shade300,
                  radius: const Radius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    color: Colors.grey.shade100,
                    height: 176,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Get your 2021 taxes done confidently. Save 20% on TurboTax O...",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.grey.shade900,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(height: 50),
                        TextButton(
                          onPressed: (){}, 
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 34),
                            side: const BorderSide(color: Colors.black),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                            )
                          ),
                          child: const Text(
                            "Learn more",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 8, bottom: 20.0),
                child: Row(
                  children: [
                    Container(
                      // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 55),
                      height: 34,
                      width: 80,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 53, 17, 59),
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    const SizedBox(width: 15),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 10.0
                        ),
                        children: [
                          TextSpan(
                            text: "Learn more",
                            style: TextStyle(
                              color: Color.fromARGB(255, 28, 108, 173),
                              fontWeight: FontWeight.w600
                            )
                          ),
                          TextSpan(
                            text: " about ____ on their website.",
                            style: TextStyle(
                              color: Colors.black,
                            )
                          )
                        ]
                      )
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _AccountTotal extends StatelessWidget {
  const _AccountTotal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 15.0, bottom: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Total:",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.bold
            )
          ),
          Text(
            "\$43234.94",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w400
            )
          )
        ],
      ),
    );
  }
}

class _AccountHeader extends StatelessWidget {
  const _AccountHeader({
    Key? key,
    required this.accountCount }) : super(key: key);

  final int accountCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, right: 12.0, bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Banking ($accountCount)",
              style: const TextStyle(
                color: Helpers.appColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w700
              ),
            ),
            const Icon(
              CupertinoIcons.chevron_up,
              color: Helpers.appColor,
              size: 20.0
            )
          ],
        ),
      ),
    );
  }
}

class _AccountItem extends StatelessWidget {
  const _AccountItem({
    Key? key,
    required this.accountName,
    required this.accountBalance,
    required this.accountNumber,
    required this.onTap }) : super(key: key);

  final String accountName;
  final double accountBalance;
  final String accountNumber;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 10.0, right: 12.0, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: accountName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      TextSpan(
                        text: " ($accountNumber)",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400
                        )
                      )
                    ]
                  )
                ),
                const SizedBox(height: 1),
                Text(
                  "\$$accountBalance",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400
                  )
                )
              ],
            )
          ],
        ),
      )
    );
  }
}