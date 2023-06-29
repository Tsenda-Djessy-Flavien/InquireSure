import 'package:analyse_gp/utils/colors.dart';
import 'package:flutter/material.dart';

class CheckStatus extends StatelessWidget {
  const CheckStatus({required this.analysisStatus, super.key});

  final String analysisStatus;

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
            'Status: $analysisStatus',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: analysisStatus.startsWith('Error')
                  ? appRedColor
                  : appBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}
