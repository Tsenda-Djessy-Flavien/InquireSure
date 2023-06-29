import 'package:analyse_gp/utils/colors.dart';
import 'package:flutter/material.dart';

class CheckMalicious extends StatelessWidget {
  const CheckMalicious({required this.maliciousStatus, super.key});

  final String maliciousStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(color: kCheckIconColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_rounded,
            color: kCheckIconColor,
            size: 30,
          ),
          const SizedBox(width: 15),
          Text(
            'Malveillant: $maliciousStatus/90',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: maliciousStatus.startsWith('Error')
                  ? appRedColor
                  : appBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}
