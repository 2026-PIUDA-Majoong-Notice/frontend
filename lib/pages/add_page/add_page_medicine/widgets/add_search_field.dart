import 'package:flutter/material.dart';


class AddSearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final String? hintText;

  const AddSearchField({
    super.key,
    required this.controller,
    this.onChanged,
    this.onTap,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 235,
      height: 60,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        textAlignVertical: TextAlignVertical.center,
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
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xffD4D8D6),
            size: 30,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: Color(0xffD9DEDB),
            ),
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
    );
  }
}