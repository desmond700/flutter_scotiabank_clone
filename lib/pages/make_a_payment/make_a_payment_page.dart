import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scotiabank_clone/widgets/scotiabank_widgets.dart';
import 'package:intl/intl.dart';


class MakeAPaymentPage extends StatefulWidget {
  const MakeAPaymentPage({Key? key}) : super(key: key);

  @override
  State<MakeAPaymentPage> createState() => _MakeAPaymentPageState();
}

class _MakeAPaymentPageState extends State<MakeAPaymentPage> {

  final EdgeInsets padding = const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0);
  final EdgeInsets margin = const EdgeInsets.symmetric(vertical: 5.0);
  final CrossAxisAlignment verticalPosition = CrossAxisAlignment.start;
  final Border border = Border.all(color: Colors.blueGrey.shade100);
  final BorderRadius borderRadius = BorderRadius.circular(10.0);
  late ValueNotifier<ScotiabankDropdownToggleValue> _showNotifier;
  late String selectedDate;

  final Key fromKey = const Key("from");
  final Key payToKey = const Key("pay-to");
  final Key frequencyKey = const Key("frequency");

  ScotiabankDropListItemValue? from;
  ScotiabankDropListItemValue? payTo;
  ScotiabankDropListItemValue? frequency;

  @override
  void initState() {
    final now = DateTime.now();
    selectedDate = DateFormat.yMMMMd().format(now);
    var toggleValue = const ScotiabankDropdownToggleValue(key: null, show: true);
    _showNotifier = ValueNotifier(toggleValue);

    super.initState();
  }

  @override
  void dispose() {
    _showNotifier.dispose();
    super.dispose();
  }

  void _onToggleList(ScotiabankDropdownToggleValue value) {
    log("onToggleList key: ${value.key}, show: ${value.show}");
    _showNotifier.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      children: [
        ScotiabankListContainer(
          allowHeaderDivider: false,
          showNotifier: _showNotifier,
          exceptions: [fromKey, payToKey],
          items: [
            ScotiabankDropdownList(
              key: fromKey,
              showNotifier: _showNotifier,
              allowBoxShadow: false,
              borderRadius: const BorderRadius.only(topRight: Radius.circular(10.0)),
              containerPadding: EdgeInsets.zero,
              headerPadding: const EdgeInsets.only(top: 18.0, bottom: 18.0, right: 18.0),
              listItemPadding: const EdgeInsets.only(top: 18.0, bottom: 18.0, right: 18.0),
              headerTitle: const Text(
                "From",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600
                )
              ),
              headerSecondaryTitle: Text(
                "Select account",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16.0
                )
              ),
              itemTextStyle: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 15,
                fontWeight: FontWeight.w600
              ),
              items: const [
                ScotiabankDropListItemValue(label: "Once", value: "once"),
                ScotiabankDropListItemValue(label: "Weekly", value: "weekly"),
                ScotiabankDropListItemValue(label: "Biweekly", value: "biweekly"),
                ScotiabankDropListItemValue(label: "Monthly", value: "monthly")
              ],
              onValueChange: (index, value) {},
              onToggleList: _onToggleList
            ),
            ScotiabankDropdownList(
              key: payToKey,
              showNotifier: _showNotifier,
              allowBoxShadow: false,
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10.0)),
              containerPadding: EdgeInsets.zero,
              headerPadding: const EdgeInsets.only(top: 18.0, bottom: 18.0, right: 18.0),
              listItemPadding: const EdgeInsets.only(top: 18.0, bottom: 18.0, right: 18.0),
              headerTitle: const Text(
                "Pay to",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600
                )
              ),
              headerSecondaryTitle: Text(
                "Select payee",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16.0
                )
              ),
              itemTextStyle: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 15,
                fontWeight: FontWeight.w600
              ),
              items: const [
                ScotiabankDropListItemValue(label: "Once", value: "once"),
                ScotiabankDropListItemValue(label: "Weekly", value: "weekly"),
                ScotiabankDropListItemValue(label: "Biweekly", value: "biweekly"),
                ScotiabankDropListItemValue(label: "Monthly", value: "monthly")
              ],
              onValueChange: (index, value) {},
              onToggleList: _onToggleList
            ),
          ]
        ),
        ScotiabankListItem(
          showNotifier: _showNotifier,
          padding: padding,
          margin: margin,
          borderRadius: borderRadius,
          verticalPosition: verticalPosition,
          border: border,
          title: const Text(
            "Amount",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600
            )
          ),
          secondaryTitle: SizedBox(
            height: 28,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter amount",
                hintStyle: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey.shade500
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              )
            ),
          )
        ),
        ScotiabankDropdownList(
          key: frequencyKey,
          showNotifier: _showNotifier,
          border: border,
          borderRadius: borderRadius,
          containerPadding: const EdgeInsets.only(left: 18.0),
          headerPadding: const EdgeInsets.only(top: 18.0, bottom: 18.0, right: 18.0),
          listItemPadding: const EdgeInsets.only(top: 18.0, bottom: 18.0, right: 18.0),
          headerTitle: Text(
            "Frequency",
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 15,
              fontWeight: FontWeight.w500
            )
          ),
          headerSecondaryTitle: Text(
            frequency == null ? "Select frequency" : frequency!.label,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 15,
              fontWeight: FontWeight.w600
            )
          ),
          itemTextStyle: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 15,
            fontWeight: FontWeight.w600
          ),
          items: const [
            ScotiabankDropListItemValue(label: "Once", value: "once"),
            ScotiabankDropListItemValue(label: "Weekly", value: "weekly"),
            ScotiabankDropListItemValue(label: "Biweekly", value: "biweekly"),
            ScotiabankDropListItemValue(label: "Monthly", value: "monthly")
          ],
          onValueChange: (index, value) {
            setState(() {
              frequency = value;
            });
          },
          onToggleList: _onToggleList
        ),
        ScotiabankListItem(
          showNotifier: _showNotifier,
          padding: padding,
          margin: margin,
          borderRadius: borderRadius,
          verticalPosition: verticalPosition,
          border: border,
          trailing: const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Icon(
              CupertinoIcons.calendar,
              color: Colors.green
            ),
          ),
          title: Text(
            "Date",
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 15,
              fontWeight: FontWeight.w500
            )
          ),
          secondaryTitle: Text(
            selectedDate,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16.0
            )
          ),
          onTap: () async {
            DateTime? date = await showDatePicker(
              context: context, 
              initialDate: DateTime.now(), 
              firstDate: DateTime(2015, 8),
              lastDate: DateTime(2101)
            );

            if (date == null) return;

            setState(() {
              selectedDate = DateFormat.yMMMMd().format(date);
            });
          },
        ),
        ScotiabankPageNotification(
          showNotifier: _showNotifier,
          textItems: [
            TextSpan(
              text: "Bill payments may take up to ",
              style: TextStyle(
                color: Colors.grey.shade700,
              )
            ),
            TextSpan(
              text: "3 business days ",
              style: TextStyle(
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w500
              )
            ),
            TextSpan(
              text: "to process and post.\n",
              style: TextStyle(
                color: Colors.grey.shade700,
              )
            ),
            const TextSpan(
              text: "Show more",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600
              )
            )
          ],
        )
      ],
    );
  }
}