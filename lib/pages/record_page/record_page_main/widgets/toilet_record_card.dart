import 'package:flutter/material.dart';


class ToiletRecordCard extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const ToiletRecordCard({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: 150,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xffD9DEDB),
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'SCDream',
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Color(0xff26332F),
        ),
      ),
    );

    if (onTap == null) {
      return card;
    }

    return GestureDetector(
      onTap: onTap,
      child: card,
    );
  }
}