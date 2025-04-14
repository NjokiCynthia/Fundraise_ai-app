import 'package:carousel_slider/carousel_slider.dart';
import 'package:flexfund_app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final topCategories = [
      'Trending',
      'Urgent',
      'Friends & Family',
      'Nearby Causes',
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Welcome to FlexFund'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 300,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                    items: [
                      WelcomeCard(),
                      ProgressUpdateCard(),
                      GetInvolvedCard(),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Top Categories
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Top Categories",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Add more",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: FlexFundTheme.primaryGreen,
                          decoration: TextDecoration.underline,
                          decorationColor: FlexFundTheme.primaryGreen,
                          decorationThickness: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 40,
                    child: Row(
                      children: List.generate(
                        topCategories.length,
                        (index) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Chip(
                              label: Text(
                                topCategories[index],
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: FlexFundTheme.primaryGreen
                                  .withValues(alpha: 0.2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recommended For You",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "View all",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: FlexFundTheme.primaryGreen,
                            decoration: TextDecoration.underline,
                            decorationColor: FlexFundTheme.primaryGreen,
                            decorationThickness: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return _buildFundraiserCard(index);
                    },
                  ),

                  const SizedBox(height: 16),

                  // Fixed Bottom Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 202, 223, 242)
                        ..withValues(alpha: 0.1),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.campaign,
                          color: Colors.blue,
                          size: 40,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Need help funding a goal?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text("Start a fundraiser in minutes!"),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: FlexFundTheme.primaryGreen,
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Create",
                            style: FlexFundTheme.buttonText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFundraiserCard(int index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Fundraiser Title ${index + 1}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.3 + (index * 0.2),
              color: FlexFundTheme.primaryGreen,
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(height: 8),
            Text(
              "KES ${(10000 + index * 5000).toString()} raised of KES 20000",
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                  label: const Text("Save"),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  label: const Text("Share"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            FlexFundTheme.primaryGreen,
            FlexFundTheme.lightBlue,
            FlexFundTheme.lightGreen,
            FlexFundTheme.softOrange,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.celebration, color: Colors.white, size: 40),
          const SizedBox(height: 16),
          Text(
            'Karibu to FlexFund!',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Support dreams. Empower Change.',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Color(0xFF157F3D),
            ),
            icon: Icon(Icons.info_outline),
            label: Text('How it Works'),
            onPressed: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: OnboardingGuideScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProgressUpdateCard extends StatelessWidget {
  const ProgressUpdateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            FlexFundTheme.primaryGreen,
            FlexFundTheme.lightBlue,
            FlexFundTheme.lightGreen,
            FlexFundTheme.softOrange,
          ],
        ),
        color: const Color(0xFF0F5A2E),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.thumb_up_alt, color: Colors.white, size: 40),
          const SizedBox(height: 16),
          const Text(
            'Thanks for supporting Amani\'s Education Fund!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const LinearProgressIndicator(
            value: 0.7,
            backgroundColor: Colors.white24,
            color: Colors.orange,
          ),
          const SizedBox(height: 8),
          const Text(
            'Ksh 70,000 of 100,000 raised!',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 8),
          const Text(
            'You contributed Ksh 5,000',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          // const Text(R
          //   'Pledge progress: 5,000 of 10,000',
          //   style: TextStyle(color: Colors.white70),
          // ),
          // const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                icon: const Icon(Icons.share),
                label: const Text('Share'),
                onPressed: () {},
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                icon: const Icon(Icons.favorite, color: Colors.orange),
                label: const Text(
                  'Donate',
                  style: TextStyle(color: Colors.orange),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GetInvolvedCard extends StatelessWidget {
  const GetInvolvedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            FlexFundTheme.primaryGreen,
            FlexFundTheme.lightBlue,
            FlexFundTheme.lightGreen,
            FlexFundTheme.softOrange,
          ],
        ),
        //gradient: LinearGradient(colors: [Colors.teal, Color(0xFF157F3D)]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.handshakeAngle, color: Colors.white, size: 40),
          const SizedBox(height: 16),
          Text(
            'More Ways to Get Involved',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Start your own fundraiser, set recurring donations, or explore trending causes!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            icon: Icon(Icons.add_circle, color: Color(0xFF157F3D)),
            label: Text(
              'Get Started',
              style: TextStyle(color: Color(0xFF157F3D)),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class OnboardingGuideScreen extends StatelessWidget {
  const OnboardingGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getting Started'),
        backgroundColor: Color(0xFF157F3D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.search, color: Color(0xFF157F3D)),
              title: Text('Discover Fundraisers'),
              subtitle: Text('Browse causes that matter to you.'),
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Colors.orange),
              title: Text('Support & Share'),
              subtitle: Text('Donate securely and spread the word.'),
            ),
            ListTile(
              leading: Icon(Icons.track_changes, color: Colors.teal),
              title: Text('Track Impact'),
              subtitle: Text('See how your contribution makes a difference.'),
            ),
          ],
        ),
      ),
    );
  }
}
