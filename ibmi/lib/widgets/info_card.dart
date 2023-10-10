import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final Widget child;
  final double width, height;

  const InfoCard(
      {required this.child, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.white24,
              blurRadius: 5,
            )
          ]),
    );
  }
}
