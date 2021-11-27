import 'package:flutter/material.dart';

class TextWithIcon extends StatelessWidget {
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final IconData icon;
  final String text;
  final VoidCallback? onPressed;

  const TextWithIcon(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      required this.color,
      required this.icon,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: color,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Icon(
            icon,
            color: color,
            size: fontSize,
          ),
        ],
      ),
    );
  }
}
