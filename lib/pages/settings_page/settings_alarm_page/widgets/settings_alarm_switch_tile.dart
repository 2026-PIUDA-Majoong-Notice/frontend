import 'package:flutter/material.dart';


class SettingsAlarmSwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool showDivider;

  const SettingsAlarmSwitchTile({
    super.key,
    required this.title,
    required this.value,
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
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'SCDream',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff26332F),
                  ),
                ),
              ),
              Transform.scale(
                scale: 0.75,
                child: Switch(
                  value: value,
                  activeColor: Colors.white,
                  activeTrackColor: const Color(0xff6FAF9B),
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: const Color(0x2226332F),
                  trackOutlineColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return const Color(0xff6FAF9B);
                    }
                    return const Color(0x2226332F);
                  }),
                  onChanged: onChanged,
                ),
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