import 'package:flutter/material.dart';
import 'package:togather/constant.dart';

class BasicCard extends StatelessWidget {
  final Widget child;

  const BasicCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [defaultShadow],
      ),
      child: child,
    );
  }
}
