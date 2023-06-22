import 'package:analyse_gp/utils/colors.dart';
import 'package:flutter/material.dart';

class CheckMalicious extends StatelessWidget {
  const CheckMalicious({required this.maliciousStatus, super.key});

  final String maliciousStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "État malveillant : ",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 10),
        CircleAvatar(
          radius: 33,
          backgroundColor: kCheckIconColor,
          child: CircleAvatar(
            radius: 28,
            backgroundColor: appBlackColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  maliciousStatus, // maliciousStatus
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kCheckIconColor,
                  ),
                ),
                const Text(
                  '/90',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
