import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scotiabank_clone/widgets/scotiabank_widgets.dart';

class DepositChequePage extends StatefulWidget {
  const DepositChequePage({Key? key}) : super(key: key);

  @override
  State<DepositChequePage> createState() => _DepositChequePageState();
}

class _DepositChequePageState extends State<DepositChequePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ScotiabankAppBar(
          allowNavigatorPop: true,
          backgroundColor: Colors.white,
          leadingImg: "assets/images/scotiabank_logo_red.png",
          titleLabel: "Deposit a cheque",
          trailingIcon: Icons.help_outline
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50.0),
              Image.asset(
                "assets/images/scotiabank_cheque.png",
                height: 50.0,
                width: 50.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 28.0),
              const Text(
                "Deposit a cheque",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 10.0),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 16.0
                  ),
                  children: [
                    TextSpan(
                      text: "Deposits can take up to ",
                      style: TextStyle(
                        color: Colors.grey.shade600
                      )
                    ),
                    const TextSpan(
                      text: "3 business days ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                      )
                    ),
                    TextSpan(
                      text: "to process, learn about our ",
                      style: TextStyle(
                        color: Colors.grey.shade600
                      )
                    ),
                      TextSpan(
                      text: "Cheque Hold Policy.",
                      style: TextStyle(
                        color: Colors.blue.shade500,
                      )
                    )
                  ]
                )
              ),
              const SizedBox(height: 20.0,),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Learn more about your ",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16.0
                      )
                    ),
                      TextSpan(
                      text: "cash back limit.",
                      style: TextStyle(
                        color: Colors.blue.shade500,
                        fontSize: 16.0
                      )
                    )
                  ]
                )
              ),
              const SizedBox(height: 30.0),
              ScotiabankListContainer(
                padding: const EdgeInsets.only(left: 20.0),
                items: [
                  ScotiabankListItem(
                    allowBoxShadow: false,
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(10)),
                    padding: const EdgeInsets.only(top: 18.0, bottom: 18.0, left: 0.0, right: 18.0),
                    title: const Text(
                      "Deposit to",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    secondaryTitle: Text(
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
                  ScotiabankListItem(
                    allowBoxShadow: false,
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10)),
                    padding: const EdgeInsets.only(top: 18.0, bottom: 18.0, left: 0.0, right: 18.0),
                    title: const Text(
                      "Amount",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    secondaryTitle: Text(
                      "Enter deposit amount",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400
                      ),
                    )
                  ),
                ]
              ),
              const SizedBox(height: 40.0),
              ScotiabankListContainer(
                allowListDivider: false,
                padding: const EdgeInsets.all(18.0),
                items: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Capture cheque image",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        "Take a photo of the front of the cheque, and then the back of the cheque",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  _CameraButton(
                    label: "Front of cheque", 
                    icon: CupertinoIcons.camera,
                    onTap: (){}
                  ),
                  const SizedBox(height: 10.0),
                  _CameraButton(
                    label: "Back of cheque", 
                    icon: CupertinoIcons.camera,
                    onTap: (){}
                  )
                ],
              ),
              const SizedBox(height: 40.0),
              ScotiabankSlider(
                label: "Slide to deposit",
                onSliderEnd: (){}
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CameraButton extends StatelessWidget {
  const _CameraButton({
    Key? key,
    required this.label,
    required this.icon,
    this.onTap }) : super(key: key);

  final String label;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        radius: const Radius.circular(10.0),
        color: Colors.grey.shade300,
        child: SizedBox(
          height: 150,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.black,
                size: 24.0,
              ),
              const SizedBox(height: 20.0,),
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}