import 'package:flutter/material.dart';


class RecordTypeIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final double size;
  final double iconSize;
  final double spacing;
  final Color backgroundColor;
  final Color iconColor;
  final TextStyle? labelStyle;
  final VoidCallback? onTap;

  const RecordTypeIcon({
    super.key,
    required this.icon,
    required this.label,
    this.size = 56,
    this.iconSize = 28,
    this.spacing = 6,
    this.backgroundColor = const Color(0xffDDF0EA),
    this.iconColor = const Color(0xff6FAF9B),
    this.labelStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
          child: Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
        ),
        SizedBox(height: spacing),
        Text(
          label,
          textAlign: TextAlign.center,
          style: labelStyle ??
              const TextStyle(
                fontFamily: 'SCDream',
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Color(0xff26332F),
              ),
        ),
      ],
    );

    if (onTap == null) {
      return content;
    }

    return GestureDetector(
      onTap: onTap,
      child: content,
    );
  }
}