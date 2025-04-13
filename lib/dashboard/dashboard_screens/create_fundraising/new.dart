// import 'package:flexfund_app/services/gemini_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flexfund_app/theme/color_theme.dart';

// class CampaignChatAssistant extends StatefulWidget {
//   const CampaignChatAssistant({super.key});

//   @override
//   _CampaignChatAssistantState createState() => _CampaignChatAssistantState();
// }

// class _CampaignChatAssistantState extends State<CampaignChatAssistant> {
//   final List<_ChatMessage> _messages = [];
//   final TextEditingController _inputController = TextEditingController();

//   String campaignName = '';
//   String goal = '';
//   String amount = '';
//   String generatedDescription = '';
//   bool isLoading = false;
//   int step = 0;

//   @override
//   void initState() {
//     super.initState();
//     _addBotMessage("Hi! Let's create your fundraising campaign. What is the name of your campaign?");
//   }

//   void _addBotMessage(String text, {bool isEditable = false}) {
//     setState(() {
//       _messages.add(_ChatMessage(text: text, isBot: true, isEditable: isEditable));
//     });
//   }

//   void _addUserMessage(String text) {
//     setState(() {
//       _messages.add(_ChatMessage(text: text, isBot: false));
//     });
//   }

//   void _handleSend() async {
//     final input = _inputController.text.trim();
//     if (input.isEmpty || isLoading) return;

//     _addUserMessage(input);
//     _inputController.clear();

//     switch (step) {
//       case 0:
//         campaignName = input;
//         _addBotMessage("Great! What's the goal of this campaign?");
//         step++;
//         break;
//       case 1:
//         goal = input;
//         _addBotMessage("Awesome. Lastly, what’s the target amount (in KES)?");
//         step++;
//         break;
//       case 2:
//         amount = input;
//         _addBotMessage("Generating your campaign description...");
//         setState(() => isLoading = true);
//         final description = await GeminiService.generateDescription(
//           name: campaignName,
//           goal: goal,
//           targetAmount: amount,
//         );
//         setState(() => isLoading = false);
//         generatedDescription = description;
//         _addBotMessage(description, isEditable: true);
//         step++;
//         break;
//       default:
//         _addBotMessage("If you'd like to start over, just go back and reopen this screen.");
//     }
//   }

//   void _showEditDialog(String originalText, int index) {
//     final TextEditingController _editController =
//         TextEditingController(text: originalText);

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Edit Description'),
//         content: TextField(
//           controller: _editController,
//           maxLines: 6,
//           decoration: const InputDecoration(
//             border: OutlineInputBorder(),
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final updated = _editController.text.trim();
//               if (updated.isNotEmpty) {
//                 setState(() {
//                   // Update the message in the messages list
//                   _messages[index] = _ChatMessage(text: updated, isBot: true, isEditable: true);
//                   generatedDescription = updated; // Update the generated description
//                 });
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Description updated and selected!')),
//                 );
//               }
//               Navigator.pop(context);
//             },
//             child: const Text('Use this'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Campaign Chat Assistant"),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(16),
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 final message = _messages[index];
//                 final isBot = message.isBot;
//                 final isEditable = message.isEditable;

//                 final bubble = Container(
//                   margin: const EdgeInsets.symmetric(vertical: 6),
//                   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//                   decoration: BoxDecoration(
//                     color: isBot ? const Color(0xFFE1FFC7) : Colors.green.shade100,
//                     borderRadius: BorderRadius.only(
//                       topLeft: const Radius.circular(16),
//                       topRight: const Radius.circular(16),
//                       bottomLeft: isBot ? const Radius.circular(0) : const Radius.circular(16),
//                       bottomRight: isBot ? const Radius.circular(16) : const Radius.circular(0),
//                     ),
//                   ),
//                   child: Text(message.text, style: const TextStyle(fontSize: 16)),
//                 );

//                 return Align(
//                   alignment: isBot ? Alignment.centerLeft : Alignment.centerRight,
//                   child: isEditable
//                       ? GestureDetector(
//                           onTap: () => _showEditDialog(message.text, index),
//                           child: bubble,
//                         )
//                       : bubble,
//                 );
//               },
//             ),
//           ),
//           if (isLoading)
//             const Padding(
//               padding: EdgeInsets.only(bottom: 10),
//               child: CircularProgressIndicator(),
//             ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _inputController,
//                     onSubmitted: (_) => _handleSend(),
//                     decoration: InputDecoration(
//                       hintText: "Type your response...",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(24),
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(horizontal: 20),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 CircleAvatar(
//                   backgroundColor: FlexFundTheme.primaryGreen,
//                   child: IconButton(
//                     icon: const Icon(Icons.send, color: Colors.white),
//                     onPressed: _handleSend,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ChatMessage {
//   final String text;
//   final bool isBot;
//   final bool isEditable;

//   _ChatMessage({
//     required this.text,
//     required this.isBot,
//     this.isEditable = false,
//   });
// }
