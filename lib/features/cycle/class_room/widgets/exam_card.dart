import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';

class ExamCard extends StatelessWidget {
  const ExamCard(
      {super.key,
      required this.title,
      required this.course,
      required this.timeDetail,
      required this.statusText,
      required this.statusColor,
      required this.icon,
      required this.isInteractive,
      required this.metaLabel});

  final String title;
  final String course;
  final String timeDetail;
  final String statusText;
  final Color statusColor;
  final IconData icon;
  final bool isInteractive;
  final String metaLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).dividerColor, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.015),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: statusColor, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course,
                      style:const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: SColors.primary),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ],
                ),
              ),
            ],
          ),
        const  Padding(
            padding: EdgeInsets.symmetric(vertical: 14.0),
            child: Divider(height: 1),
          ),
          Wrap(
            spacing: 12,
            runSpacing: 10,
            alignment: WrapAlignment.spaceBetween,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 220),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      timeDetail,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onSurfaceVariant),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      metaLabel,
                      style: TextStyle(
                          fontSize: 11,
                            color: Theme.of(context)
                              .colorScheme
                              .onSurfaceVariant
                              .withValues(alpha: 0.7),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: isInteractive ? () {} : null,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                    backgroundColor: isInteractive
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).disabledColor.withValues(alpha: 0.15),
                  foregroundColor: isInteractive
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).disabledColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  isInteractive ? 'Review Now' : statusText,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
