import 'package:flutter/material.dart';


class AddTimeField extends StatelessWidget {
  final String label;
  final TimeOfDay? value;
  final ValueChanged<TimeOfDay> onChanged;

  const AddTimeField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  String _formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const SizedBox(width: 40),
          SizedBox(
            width: 80,
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
          const SizedBox(width: 70),
          GestureDetector(
            onTap: () async {
              final picked = await showTimePicker(
                context: context,
                initialTime: value ?? TimeOfDay.now(),
              );

              if (picked != null) {
                onChanged(picked);
              }
            },
            child: Container(
              height: 50,
              width: 150,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xffD9DEDB),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 28,
                    color: Color(0xffD4D8D6),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    value == null ? '' : _formatTime(value!),
                    style: const TextStyle(
                      fontFamily: 'SCDream',
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff26332F),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}