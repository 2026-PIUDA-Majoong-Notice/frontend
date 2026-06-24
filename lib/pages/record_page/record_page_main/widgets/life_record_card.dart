import 'package:flutter/material.dart';

class LifeRecordCard extends StatelessWidget {
  final String leftText;
  final String rightText;
  final VoidCallback? onTap;

  const LifeRecordCard({
    super.key,
    required this.leftText,
    required this.rightText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: 250,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xffD9DEDB),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              leftText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'SCDream',
                fontSize: 13,
                fontWeight: FontWeight.w300,
                color: Color(0xff26332F),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            width: 1,
            height: 20,
            color: const Color(0xffE5E8E6),
          ),
          Expanded(
            child: Text(
              rightText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'SCDream',
                fontSize: 13,
                fontWeight: FontWeight.w300,
                color: Color(0xff26332F),
              ),
            ),
          ),
        ],
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