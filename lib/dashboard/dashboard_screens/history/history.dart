import 'package:flexfund_app/dashboard/dashboard_screens/history/payment_screen.dart';
import 'package:flexfund_app/theme/color_theme.dart';
import 'package:flexfund_app/theme/widget.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> with SingleTickerProviderStateMixin {
  late TabController _tabController;
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
          Padding(
            padding: const EdgeInsets.all(16.0),
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
                tabs: [Tab(text: "Pledged"), Tab(text: "Completed")],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [PendingDonationsTab(), CompletedDonationsTab()],
            ),
          ),
        ],
      ),
    );
  }
}

class PendingDonationsTab extends StatelessWidget {
  const PendingDonationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        DonationHistoryCard(
          title: "Education Fund",
          amount: "Ksh 500",
          subtitle: "Created on Mar 1, 2025",
          status: "Pending",
          icon: Icons.school,
          statusColor: Colors.orange,
          contributedAmount: 200, // Already paid
          targetAmount: 500, // Total pledge
          action: IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 16),
            onPressed: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: PaymentScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        DonationHistoryCard(
          title: "Medical Appeal",
          amount: "Ksh 1,000",
          subtitle: "Created on Feb 14, 2025",
          status: "Pending",
          icon: Icons.health_and_safety,
          statusColor: Colors.orange,
          contributedAmount: 100,
          targetAmount: 1000,
          action: IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 16),
            onPressed: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: PaymentScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        DonationHistoryCard(
          title: "Community Project",
          amount: "Ksh 2,000",
          subtitle: "Created on Jan 10, 2025",
          status: "Pending",
          icon: Icons.group,
          statusColor: Colors.orange,
          contributedAmount: 500, // Partially paid
          targetAmount: 2000,
          action: IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 16),
            onPressed: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: PaymentScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
          ),
        ),
      ],
    );
  }
}

class CompletedDonationsTab extends StatelessWidget {
  const CompletedDonationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        DonationHistoryCard(
          title: "Water Project Campaign",
          amount: "Ksh 2,000",
          subtitle: "March 20, 2025 · 2:35 PM · M-Pesa",
          status: "Successful",
          icon: Icons.water_drop,
          statusColor: Colors.green,
          progressText: "82% Complete",
          progressValue: 0.82,
        ),
        const SizedBox(height: 16),
        DonationHistoryCard(
          title: "Medical Drive",
          amount: "Ksh 3,000",
          subtitle: "March 15, 2025 · 1:00 PM · Card",
          status: "Successful",
          icon: Icons.local_hospital,
          statusColor: Colors.green,
        ),
      ],
    );
  }
}
