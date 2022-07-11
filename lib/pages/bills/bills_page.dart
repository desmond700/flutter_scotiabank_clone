import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scotiabank_clone/helpers/helpers.dart';
import 'package:flutter_scotiabank_clone/pages/make_a_payment/make_a_payment_page.dart';
import 'package:flutter_scotiabank_clone/pages/manage/manage_page.dart';
import 'package:flutter_scotiabank_clone/pages/manage_bills/manage_bills.dart';
import 'package:flutter_scotiabank_clone/widgets/scotiabank_widgets.dart';

class BillsPage extends StatefulWidget {
  const BillsPage({ 
    Key? key,
    required this.parentContext }) : super(key: key);

  static const String id = "bills_page";

  final BuildContext parentContext;

  @override
  State<BillsPage> createState() => _BillsPageState();
}

class _BillsPageState extends State<BillsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScotiabankAppBar(
        leadingImg: "assets/images/scotiabank_logo_red.png",
        titleLabel: "Bills",
        trailingIcon: Icons.help_outline,
        bottomHorizontalPadding: 20.0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Helpers.appColor,
          indicatorWeight: 4,
          labelColor: Helpers.appColor,
          labelStyle: const TextStyle(
            color: Helpers.appColor,
            fontSize: 16.0,
            fontWeight: FontWeight.bold
          ),
          unselectedLabelColor: Colors.black,
          unselectedLabelStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500
          ),
          tabs: const [
            Tab(text: "Make a payment"),
            Tab(text: "Manage bills")
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          MakeAPaymentPage(),
          ManageBillsPage()
        ]
      ),
    );
  }
}