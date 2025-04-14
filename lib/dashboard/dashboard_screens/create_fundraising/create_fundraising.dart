import 'package:flexfund_app/dashboard/dashboard_screens/create_fundraising/create_fundraising_form.dart';
import 'package:flexfund_app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CreateFundraising extends StatefulWidget {
  const CreateFundraising({super.key});

  @override
  State<CreateFundraising> createState() => _CreateFundraisingState();
}

class _CreateFundraisingState extends State<CreateFundraising>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Map<String, dynamic>? createdFundraiser;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _navigateToCreateFundraiser() async {
    final result = await PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: const CreateFundraisingForm(),
      withNavBar: false,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );

    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        createdFundraiser = result;
      });
    }
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
          const SizedBox(height: 24),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // In Progress Tab
                Stack(
                  children: [
                    ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        if (createdFundraiser != null) ...[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 6,
                            shadowColor: Colors.green.shade100,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    FlexFundTheme.primaryGreen,
                                    FlexFundTheme.lightBlue,
                                    FlexFundTheme.lightGreen,
                                    FlexFundTheme.softOrange,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        LucideIcons.heartHandshake,
                                        color: Colors.white,
                                        size: 26,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          createdFundraiser!['campaignName'],
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Icon(
                                        LucideIcons.target,
                                        color: Colors.white70,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Target: KES ${createdFundraiser!['targetAmount'].toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(
                                        LucideIcons.lightbulb,
                                        color: Colors.white70,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'Goal: ${createdFundraiser!['goal']}',
                                          style: const TextStyle(
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          LucideIcons.alignLeft,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            createdFundraiser!['description'],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ] else ...[
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
                          const SizedBox(height: 20),
                        ],
                      ],
                    ),
                    Positioned(
                      bottom: height * 0.05,
                      left: 24,
                      right: 24,
                      child: ElevatedButton(
                        onPressed: _navigateToCreateFundraiser,
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
