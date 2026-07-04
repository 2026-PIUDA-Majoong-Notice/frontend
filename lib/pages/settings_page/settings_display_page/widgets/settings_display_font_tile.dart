import 'package:flutter/material.dart';


class SettingsFontSizeTile extends StatelessWidget {
  final bool isLargeText;
  final ValueChanged<bool> onChanged;
  final bool showDivider;

  const SettingsFontSizeTile({
    super.key,
    required this.isLargeText,
    required this.onChanged,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 58,
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  '글자 크기',
                  style: TextStyle(
                    fontFamily: 'SCDream',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff26332F),
                  ),
                ),
              ),
              _FontSizeToggle(
                isLargeText: isLargeText,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0x2226332F),
          ),
      ],
    );
  }
}


class _FontSizeToggle extends StatelessWidget {
  final bool isLargeText;
  final ValueChanged<bool> onChanged;

  const _FontSizeToggle({
    required this.isLargeText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff6FAF9B),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          _FontSizeButton(
            text: '가',
            isSelected: !isLargeText,
            fontSize: 10,
            onTap: () => onChanged(false),
          ),
          _FontSizeButton(
            text: '가',
            isSelected: isLargeText,
            fontSize: 18,
            onTap: () => onChanged(true),
          ),
        ],
      ),
    );
  }
}

class _FontSizeButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final double fontSize;
  final VoidCallback onTap;

  const _FontSizeButton({
    required this.text,
    required this.isSelected,
    required this.fontSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xff6FAF9B) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'SCDream',
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: isSelected ? Colors.white : const Color(0xff6FAF9B),
            ),
          ),
        ),
      ),
    );
  }
}