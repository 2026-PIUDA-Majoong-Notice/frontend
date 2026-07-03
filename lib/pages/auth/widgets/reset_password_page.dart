import 'package:flutter/material.dart';
import 'package:majoong_notice/pages/auth/view_model/auth_view_model.dart';
import 'package:majoong_notice/pages/auth/widgets/login_page.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final viewModel = AuthViewModel();

  @override
  void dispose() {
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xFFF6FAF8),
        body: SafeArea(
          child: Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '새 비밀번호',
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'SCDream',
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF424242).withOpacity(0.8),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      cursorColor: Color(0xFF424242).withOpacity(0.8),
                      validator: viewModel.validatePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        isDense: true,
                        helperText: ' ',
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '비밀번호 확인',
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'SCDream',
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF424242).withOpacity(0.8),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: passwordConfirmController,
                      cursorColor: Color(0xFF424242).withOpacity(0.8),
                      validator: (value) => viewModel.validatePasswordConfirm(
                        value,
                        passwordController.text,
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        isDense: true,
                        helperText: ' ',
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                            (route) => false,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0xFF6FAF9B),
                        foregroundColor: Colors.white,
                        minimumSize: Size(161, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text(
                        '확인',
                        style: TextStyle(
                          fontFamily: 'SCDream',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
