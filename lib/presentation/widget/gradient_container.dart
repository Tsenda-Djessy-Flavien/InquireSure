import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final List<Color> colors;
  final Widget child;

  const GradientContainer(
    this.child, {
    required this.colors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: const Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 204, 202, 202),
            width: 0,
          ),
        ),
      ),
      child: child,
    );
  }
}
