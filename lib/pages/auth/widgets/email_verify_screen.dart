import 'package:flutter/material.dart';

class EmailVerifyScreen extends StatefulWidget {
  final String email;

  const EmailVerifyScreen({super.key, required this.email});

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6FAF8),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Icon(Icons.email, color: Color(0xFF6FAF9B), size: 100)),
            SizedBox(height: 5),
            Text(
              "인증 메일이 발송 되었습니다.\n이메일 인증을 완료하시면 계정 생성이 완료됩니다.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "SCDream",
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
