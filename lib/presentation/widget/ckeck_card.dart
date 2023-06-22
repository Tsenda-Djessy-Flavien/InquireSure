import 'package:analyse_gp/utils/colors.dart';
import 'package:flutter/material.dart';

class CheckCard extends StatelessWidget {
  const CheckCard({
    required this.engineName,
    required this.engineResult,
    super.key,
  });

  final String engineName;
  final String engineResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: appOrangeColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: appColorPrimary.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            engineName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: kCheckIconColor,
              ),
              const SizedBox(width: 5),
              Text(
                engineResult,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
