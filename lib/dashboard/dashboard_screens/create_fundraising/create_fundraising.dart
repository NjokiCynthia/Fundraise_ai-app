import 'package:flexfund_app/dashboard/dashboard_screens/create_fundraising/create_fundraising_form.dart';
import 'package:flexfund_app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CreateFundraising extends StatefulWidget {
  const CreateFundraising({super.key});

  @override
  State<CreateFundraising> createState() => _CreateFundraisingState();
}

class _CreateFundraisingState extends State<CreateFundraising>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? selectedCategory;
  final List<String> categories = [
    'Closed Fundraiser',
    'Open Fundraiser',
    'Custom Fundraiser',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.index = 0;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Fundraising'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: FlexFundTheme.mediumGray,
                  borderRadius: BorderRadius.circular(8),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [Tab(text: 'In Progress'), Tab(text: 'Finished')],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // In Progress Tab
                Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Spread kindness',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Be part of a noble cause',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: height * 0.25,
                      left: 24,
                      right: 24,
                      child: ElevatedButton(
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: CreateFundraisingForm(),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: FlexFundTheme.primaryGreen,
                        ),
                        child: const Text(
                          'Create Fundraiser',
                          style: FlexFundTheme.buttonText,
                        ),
                      ),
                    ),
                  ],
                ),

                // Finished Tab
                const Center(child: Text('No finished fundraisers yet.')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
