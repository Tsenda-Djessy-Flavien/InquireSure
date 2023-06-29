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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: appOrangeColor.withOpacity(0.7),
        border: Border.all(color: appLayoutBackground),
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
              color: appBlackColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: kCheckIconColor,
                size: 30,
              ),
              const SizedBox(width: 5),
              Text(
                engineResult,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: appBlackColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
