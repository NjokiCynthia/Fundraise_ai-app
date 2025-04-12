import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flexfund_app/theme/color_theme.dart';
import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatefulWidget {
  final double amount;
  final String description;

  const PaymentSuccessScreen({
    super.key,
    required this.amount,
    required this.description,
  });

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );
    _confettiController.play();
    super.initState();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (mounted) {
          int count = 0;
          Navigator.of(context).popUntil((route) => count++ == 2);
        }
      },
      child: Scaffold(
        backgroundColor: FlexFundTheme.primaryGreen.withValues(alpha: 50),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Confetti Animation
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              maxBlastForce: 10,
              minBlastForce: 5,
              gravity: 0.3,
              colors: [
                FlexFundTheme.primaryGreen,
                FlexFundTheme.darkOrange,
                FlexFundTheme.primaryBlue,
                FlexFundTheme.successGreen,
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("🎉", style: TextStyle(fontSize: 100)),
                    const SizedBox(height: 16),
                    const Text(
                      "Transaction Successful!",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "KES ${widget.amount.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: FlexFundTheme.mediumGray,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 32,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Your generous donation will make a difference in someone's life.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Thank you for supporting this cause. Together, we are building a better future.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          int count = 0;
                          Navigator.of(
                            context,
                          ).popUntil((route) => count++ == 2);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: FlexFundTheme.primaryGreen,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          "Completed",
                          style: FlexFundTheme.buttonText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
