import 'package:flutter/material.dart';

class DonationHistoryCard extends StatelessWidget {
  final String title;
  final String amount;
  final String subtitle;
  final String status;
  final IconData icon;
  final Color statusColor;
  final Widget? action;

  // Progress can be passed directly OR auto-calculated
  final double? progressValue;
  final String? progressText;
  final double? contributedAmount;
  final double? targetAmount;

  const DonationHistoryCard({
    super.key,
    required this.title,
    required this.amount,
    required this.subtitle,
    required this.status,
    required this.icon,
    required this.statusColor,
    this.action,
    this.progressValue,
    this.progressText,
    this.contributedAmount,
    this.targetAmount,
  });

  @override
  Widget build(BuildContext context) {
    // Auto-calculate progress if not provided
    final calculatedProgressValue =
        progressValue ??
        (contributedAmount != null && targetAmount != null
            ? (contributedAmount! / targetAmount!).clamp(0.0, 1.0)
            : null);

    final calculatedProgressText =
        progressText ??
        (contributedAmount != null && targetAmount != null
            ? "Ksh ${contributedAmount!.toStringAsFixed(0)} of Ksh ${targetAmount!.toStringAsFixed(0)}"
            : null);

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: .1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Show Progress if available
            if (calculatedProgressValue != null) ...[
              LinearProgressIndicator(
                value: calculatedProgressValue,
                backgroundColor: Colors.grey.shade300,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 4),
              Text(
                calculatedProgressText!,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 8),
            ],

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  amount,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (action != null) action!,
              ],
            ),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
