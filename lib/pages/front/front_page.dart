import 'package:flutter/material.dart';
import 'package:flutter_scotiabank_clone/helpers/helpers.dart';
import 'package:flutter_scotiabank_clone/pages/my_accounts/my_accounts_page.dart';
import 'package:flutter_scotiabank_clone/pages/my_updates/my_updates_page.dart';
import 'package:flutter_scotiabank_clone/widgets/custom_sliver_persistent_header_delegate.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({ 
    Key? key,
    required this.parentContext }) : super(key: key);

  final BuildContext parentContext;

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> with SingleTickerProviderStateMixin {

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
    return NestedScrollView(
      headerSliverBuilder: (_, __) {
        return [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
              color: Helpers.appColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/scotiabank_logo.png",
                    height: 42.0,
                    width: 42.0,
                    fit: BoxFit.contain,
                  ),
                  IconButton(
                    onPressed: (){}, 
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.help_outline,
                      color: Colors.white,
                      size: 28.0,
                    )
                  )
                ],
              ),
            )
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: CustomSliverPersistentHeaderDelegate(
              minHeight: 67, 
              maxHeight: 67, 
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                color: Helpers.appColor,
                child: TabBar(
                  controller: _tabController,
                  indicatorWeight: 3,
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey.shade200,
                  tabs: [
                    _buildTabItem("My accounts"),
                    _buildTabItem("My updates")
                  ]
                ),
              )
            )
          )
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: const [
          MyAccountsPage(),
          MyUpdatesPage()
        ]
      ),
    );
  }

  Text _buildTabItem(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700
      ),
    );
  }
}