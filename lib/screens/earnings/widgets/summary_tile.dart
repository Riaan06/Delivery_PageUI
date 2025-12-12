import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/spacing.dart';

class SummaryTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const SummaryTile({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(.1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, size: 26, color: color),
          HorizontalSpacing(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.grey[600],
                  )),
              VerticalSpacing(4),
              Text(
                value,
                style: AppTextStyles.title.copyWith(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
