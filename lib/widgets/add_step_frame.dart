import 'package:flutter/material.dart';


class AddStepFrame extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback? onCancel;
  final VoidCallback? onNext;
  final String cancelText;
  final String nextText;

  const AddStepFrame({
    super.key,
    required this.title,
    required this.child,
    this.onCancel,
    this.onNext,
    this.cancelText = '취소',
    this.nextText = '다음',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'SCDream',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xff26332F),
            ),
          ),
          Expanded(
            child: child,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _StepBottomButton(
                  text: cancelText,
                  color: const Color(0xffD4D8D6),
                  onTap: onCancel,
                ),
                _StepBottomButton(
                  text: nextText,
                  color: const Color(0xff6FAF9B),
                  onTap: onNext,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StepBottomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onTap;

  const _StepBottomButton({
    required this.text,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'SCDream',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }
}