import 'package:flutter/material.dart';


class AddStepFrame extends StatelessWidget {
  final String title;
  final Widget child;

  const AddStepFrame({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 28),
        SizedBox(
          width: double.infinity,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'SCDream',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xff26332F),
            ),
          ),
        ),
        Expanded(child: child),
      ],
    );
  }
}