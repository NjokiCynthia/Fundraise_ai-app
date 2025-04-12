// import 'package:flutter/material.dart';

// class AIDescriptionChatScreen extends StatefulWidget {
//   const AIDescriptionChatScreen({super.key});

//   @override
//   State<AIDescriptionChatScreen> createState() =>
//       _AIDescriptionChatScreenState();
// }

// class _AIDescriptionChatScreenState extends State<AIDescriptionChatScreen> {
//   final TextEditingController _inputController = TextEditingController();
//   final List<_ChatMessage> _messages = [];

//   String? campaignName;
//   String? targetAmount;
//   String? campaignGoal;

//   int step = 0;

//   @override
//   void initState() {
//     super.initState();
//     _askNextQuestion(); // Start the chat with the first question
//   }

//   void _askNextQuestion() {
//     String question;
//     switch (step) {
//       case 0:
//         question = "What's the name of your campaign?";
//         break;
//       case 1:
//         question = "What's your target amount (KES)?";
//         break;
//       case 2:
//         question = "What is the main goal of this campaign?";
//         break;
//       default:
//         return;
//     }
//     setState(() {
//       _messages.add(_ChatMessage(question, isUser: false));
//     });
//   }

//   void _handleUserInput(String input) {
//     if (input.trim().isEmpty) return;

//     setState(() {
//       _messages.add(_ChatMessage(input, isUser: true));
//     });

//     switch (step) {
//       case 0:
//         campaignName = input.trim();
//         break;
//       case 1:
//         targetAmount = input.trim();
//         break;
//       case 2:
//         campaignGoal = input.trim();
//         _generateDescription(); // All inputs done, generate description
//         break;
//     }

//     _inputController.clear();

//     setState(() {
//       step++;
//     });

//     if (step < 3) {
//       Future.delayed(const Duration(milliseconds: 300), _askNextQuestion);
//     }
//   }

//   void _generateDescription() {
//     final name = campaignName ?? '';
//     final amount = targetAmount ?? '';
//     final goal = campaignGoal ?? '';

//     final description =
//         "🌟 *$name*\n\n"
//         "This campaign is raising KES $amount to support the goal of $goal. "
//         "Your contributions will directly help make this mission a reality. "
//         "Join us in making a lasting impact.";

//     Future.delayed(const Duration(milliseconds: 500), () {
//       setState(() {
//         _messages.add(_ChatMessage(description, isUser: false));
//       });
//     });
//   }

//   void _selectAIDescription(String description) {
//     Navigator.pop(context, description);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("AI Campaign Helper"),
//         actions: [
//           if (step > 2)
//             IconButton(
//               icon: const Icon(Icons.check),
//               onPressed: () {
//                 final lastMessage = _messages.lastWhere(
//                   (m) => !m.isUser,
//                   orElse: () => _ChatMessage('', isUser: false),
//                 );
//                 if (lastMessage.text.isNotEmpty) {
//                   _selectAIDescription(lastMessage.text);
//                 }
//               },
//             ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(12),
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 final message = _messages[index];
//                 return Align(
//                   alignment:
//                       message.isUser
//                           ? Alignment.centerRight
//                           : Alignment.centerLeft,
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(vertical: 4),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 14,
//                       vertical: 10,
//                     ),
//                     constraints: BoxConstraints(
//                       maxWidth: MediaQuery.of(context).size.width * 0.75,
//                     ),
//                     decoration: BoxDecoration(
//                       color:
//                           message.isUser ? Colors.blueAccent : Colors.grey[300],
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Text(
//                       message.text,
//                       style: TextStyle(
//                         color: message.isUser ? Colors.white : Colors.black87,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           const Divider(height: 1),
//           if (step < 3) // Hide input after generating description
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _inputController,
//                       textInputAction: TextInputAction.send,
//                       onSubmitted: _handleUserInput,
//                       decoration: const InputDecoration(
//                         hintText: "Type your response...",
//                         border: OutlineInputBorder(),
//                         isDense: true,
//                         contentPadding: EdgeInsets.symmetric(
//                           horizontal: 12,
//                           vertical: 10,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   ElevatedButton(
//                     onPressed: () => _handleUserInput(_inputController.text),
//                     child: const Icon(Icons.send),
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// class _ChatMessage {
//   final String text;
//   final bool isUser;

//   _ChatMessage(this.text, {required this.isUser});
// }
