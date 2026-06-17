import 'package:flutter/material.dart';


class AddFormTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final Widget? suffix;

  const AddFormTextField({
    super.key,
    required this.label,
    this.hintText,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(40),
          child: SizedBox(
            width: 60,
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'SCDream',
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xff26332F),
              ),
            ),
          ),
        ),
        const SizedBox(width: 50),
        SizedBox(
          height: 60,
          width: 150,
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            keyboardType: keyboardType,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'SCDream',
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Color(0xff26332F),
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontFamily: 'SCDream',
                fontSize: 13,
                fontWeight: FontWeight.w300,
                color: Color(0xffD4D8D6),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Color(0xffD9DEDB)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: Color(0xff6FAF9B),
                  width: 1.4,
                ),
              ),
            ),
          ),
        ),
        if (suffix != null) ...[
          const SizedBox(width: 12),
          suffix!,
        ],
      ],
    );
  }
}