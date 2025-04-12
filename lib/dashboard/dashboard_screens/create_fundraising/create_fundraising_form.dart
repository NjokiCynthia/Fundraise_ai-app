import 'package:flexfund_app/dashboard/dashboard_screens/create_fundraising/ai_chat_toolkit';
import 'package:flexfund_app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateFundraisingForm extends StatefulWidget {
  const CreateFundraisingForm({super.key});

  @override
  State<CreateFundraisingForm> createState() => _CreateFundraisingFormState();
}

class _CreateFundraisingFormState extends State<CreateFundraisingForm> {
  final TextEditingController _campaignNameController = TextEditingController();
  final TextEditingController _targetAmountController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create a new campaign'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                TextFormField(
                  controller: _campaignNameController,
                  decoration: FlexFundTheme.textFieldDecoration(
                    labelText: 'Enter name of your campaign',
                    prefixIcon: Icons.campaign,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _targetAmountController,
                  keyboardType: TextInputType.number,
                  decoration: FlexFundTheme.textFieldDecoration(
                    labelText: 'Enter target amount',
                    prefixIcon: Icons.attach_money,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _goalController,
                  decoration: FlexFundTheme.textFieldDecoration(
                    labelText: 'Enter goal',
                    prefixIcon: Icons.flag,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: FlexFundTheme.textFieldDecoration(
                    labelText:
                        'Enter goal description to inform users on the mission',
                    prefixIcon: Icons.description_outlined,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Let user type manually — no action needed
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'You can type the description above.',
                            ),
                          ),
                        );
                      },
                      child: const Text('Just type the description'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // Navigate to AI chat page and await result
                        final aiDescription = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                // (context) => const AIDescriptionChatScreen(),
                                (context) => CampaignChatAssistant(),
                          ),
                        );

                        if (aiDescription != null && aiDescription is String) {
                          setState(() {
                            _descriptionController.text = aiDescription;
                          });
                        }
                      },
                      child: const Text('Use AI to generate description'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: FlexFundTheme.primaryGreen,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Confirm", style: FlexFundTheme.buttonText),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
