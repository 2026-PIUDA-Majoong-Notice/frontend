import 'package:flutter/material.dart';


class RecordSection extends StatelessWidget {
  final String title;
  final Widget child;

  const RecordSection({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 45),
      child: Column(
        children: [
          Container(
            height: 38,
            width: 115,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xffDDEEE7),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'SCDream',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xff26332F),
              ),
            ),
          ),
          const SizedBox(height: 25),
          child,
        ],
      ),
    );
  }
}