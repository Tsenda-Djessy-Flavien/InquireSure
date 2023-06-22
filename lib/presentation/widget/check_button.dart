import 'package:analyse_gp/utils/colors.dart';
import 'package:flutter/material.dart';

class CheckButton extends StatelessWidget {
  final VoidCallback onTap;
  final String checkContent;

  const CheckButton({
    required this.onTap,
    required this.checkContent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: appOrangeColor,
        foregroundColor: appLayoutBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      onPressed: onTap,
      child: Text(
        checkContent.toUpperCase(),
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}
