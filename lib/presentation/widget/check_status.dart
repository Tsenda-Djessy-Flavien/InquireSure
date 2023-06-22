import 'package:analyse_gp/utils/colors.dart';
import 'package:flutter/material.dart';

class CheckStatus extends StatelessWidget {
  const CheckStatus({required this.analysisStatus, super.key});

  final String analysisStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Status :",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          analysisStatus.toUpperCase(), // analysisStatus
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: kCheckIconColor,
          ),
        )
      ],
    );
  }
}
