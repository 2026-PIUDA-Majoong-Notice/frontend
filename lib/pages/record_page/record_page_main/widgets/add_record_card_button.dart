import 'package:flutter/material.dart';


class AddRecordCardButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddRecordCardButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        padding: const EdgeInsets.only(
          left: 32,
          right: 28,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffDDF0EA),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const Expanded(
              child: Text(
                '변경 사항이 있나요?\n추가로 기록해보세요!',
                style: TextStyle(
                  fontFamily: 'SCDream',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 1.15,
                  color: Color(0xff26332F),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 49,
                  height: 49,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff6FAF9B),
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 34,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '기록하러 가기',
                  style: TextStyle(
                    fontFamily: 'SCDream',
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff26332F),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}