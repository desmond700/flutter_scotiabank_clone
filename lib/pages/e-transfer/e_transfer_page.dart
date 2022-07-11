import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scotiabank_clone/helpers/helpers.dart';
import 'package:flutter_scotiabank_clone/pages/manage/manage_page.dart';
import 'package:flutter_scotiabank_clone/pages/request/request_page.dart';
import 'package:flutter_scotiabank_clone/pages/send/send_page.dart';

class ETransferPage extends StatefulWidget {
  const ETransferPage({ 
    Key? key,
    required this.baseContext,
    required this.mainNavigatorContext }) : super(key: key);

  static const String id = "e-transfer_page";
  final BuildContext baseContext;
  final BuildContext mainNavigatorContext;

  @override
  State<ETransferPage> createState() => _ETransferPageState();
}

class _ETransferPageState extends State<ETransferPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(), 
          icon: const Icon(
            CupertinoIcons.arrow_left,
            color: Colors.black,
            size: 26.0,
          )
        ),
        title: RichText(
          text: const TextSpan(
            style: TextStyle(
              color: Colors.black
            ),
            children: [
              TextSpan(
                text: "Interac ",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                   fontSize: 15.0
                )
              ),
              TextSpan(
                text: "e-Transfer",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                )
              )
            ]
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(
              Icons.help_outline,
              color: Colors.black,
              size: 26.0,
            )
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TabBar(
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
                Tab(text: "Send"),
                Tab(text: "Request"),
                Tab(text: "Manage")
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SendPage(
            baseContext: widget.baseContext,
            mainNavigatorContext: widget.mainNavigatorContext
          ),
          const RequestPage(),
          const ManagePage()
        ]
      ),
    );
  }
}