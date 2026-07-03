import 'package:flutter/material.dart';

import 'add_choice_pill_button.dart';

class AddChoicePill<T> extends StatelessWidget {
  final String label;
  final List<T> options;
  final T selectedValue;
  final String Function(T value) labelBuilder;
  final ValueChanged<T> onChanged;
  final bool wrapOptions;

  const AddChoicePill({
    super.key,
    required this.label,
    required this.options,
    required this.selectedValue,
    required this.labelBuilder,
    required this.onChanged,
    this.wrapOptions = false,
  });

  static const TextStyle _labelStyle = TextStyle(
    fontFamily: 'SCDream',
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Color(0xff26332F),
  );

  @override
  Widget build(BuildContext context) {
    if (wrapOptions) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                label,
                style: _labelStyle,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 40),
              child: Wrap(
                spacing: 16,
                runSpacing: 12,
                children: options.map((option) {
                  final isSelected = option == selectedValue;

                  return AddChoicePillButton(
                    text: labelBuilder(option),
                    isSelected: isSelected,
                    onTap: () => onChanged(option),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    }

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:40, vertical: 20),
          child: SizedBox(
            width: 60,
            child: Text(
              label,
              style: _labelStyle,
            ),
          ),
        ),
        const SizedBox(width: 50),
        Row(
          children: options.map((option) {
            final isSelected = option == selectedValue;

            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: AddChoicePillButton(
                text: labelBuilder(option),
                isSelected: isSelected,
                onTap: () => onChanged(option),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}