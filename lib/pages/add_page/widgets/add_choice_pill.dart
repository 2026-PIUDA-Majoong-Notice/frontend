import 'package:flutter/material.dart';


class AddChoicePill<T> extends StatelessWidget {
  final String label;
  final List<T> options;
  final T selectedValue;
  final String Function(T value) labelBuilder;
  final ValueChanged<T> onChanged;

  const AddChoicePill({
    super.key,
    required this.label,
    required this.options,
    required this.selectedValue,
    required this.labelBuilder,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
        Row(
          children: options.map((option) {
            final isSelected = option == selectedValue;

            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () => onChanged(option),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 160),
                  height: 45,
                  width: 75,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xffE5F3EE)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xff6FAF9B)
                          : const Color(0xffD9DEDB),
                      width: isSelected ? 1.4 : 1,
                    ),
                  ),
                  child: Text(
                    labelBuilder(option),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'SCDream',
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff26332F),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}