import 'package:flutter/material.dart';
import 'package:majoong_notice/components/loading_overlay.dart';
import 'package:majoong_notice/pages/auth/view_model/auth_view_model.dart';
import 'package:majoong_notice/pages/auth/widgets/email_verify_screen.dart';
import 'package:majoong_notice/pages/auth/widgets/login_page.dart';
import 'package:majoong_notice/pages/home_page/widgets/home_page.dart';
import 'package:get/get.dart';

import 'package:majoong_notice/services/http/user/user_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  String? selectedRole;
  final _formKey = GlobalKey<FormState>();
  final viewModel = AuthViewModel();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF6FAF8),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 115),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '성함',
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'SCDream',
                            fontWeight: FontWeight.w300,
                            color: const Color(0xFF424242).withOpacity(0.8),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: nameController,
                        cursorColor: const Color(0xFF424242).withOpacity(0.8),
                        validator: viewModel.validateName,
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                          helperText: ' ',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '역할',
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'SCDream',
                            fontWeight: FontWeight.w300,
                            color: const Color(0xFF424242).withOpacity(0.8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: ['개인 보호자', '요양원 종사자'].map((role) {
                            final isSelected = selectedRole == role;
                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: GestureDetector(
                                  onTap: () =>
                                      setState(() => selectedRole = role),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? const Color(0xFF6FAF9B)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: isSelected
                                            ? const Color(0xFF6FAF9B)
                                            : Colors.grey,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        role,
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.grey,
                                          fontFamily: 'SCDream',
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '이메일',
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'SCDream',
                            fontWeight: FontWeight.w300,
                            color: const Color(0xFF424242).withOpacity(0.8),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: emailController,
                        cursorColor: const Color(0xFF424242).withOpacity(0.8),
                        validator: viewModel.validateEmail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          helperText: ' ',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '비밀번호',
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'SCDream',
                            fontWeight: FontWeight.w300,
                            color: const Color(0xFF424242).withOpacity(0.8),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: passwordController,
                        cursorColor: const Color(0xFF424242).withOpacity(0.8),
                        validator: viewModel.validatePassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          helperText: ' ',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '비밀번호 확인',
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'SCDream',
                            fontWeight: FontWeight.w300,
                            color: const Color(0xFF424242).withOpacity(0.8),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: passwordConfirmController,
                        cursorColor: const Color(0xFF424242).withOpacity(0.8),
                        validator: (value) => viewModel.validatePasswordConfirm(
                          value,
                          passwordController.text,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          helperText: ' ',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      ElevatedButton(
                        onPressed: () async {
                          if (selectedRole == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('역할을 선택해주세요')),
                            );
                            return;
                          }

                          if (_formKey.currentState!.validate()) {
                            showLoading();
                            try {
                              final userId = await signUp(
                                email: emailController.text.trim(),
                                password: passwordController.text,
                                passwordConfirm: passwordConfirmController.text,
                                name: nameController.text,
                              );
                              // print('성공! userId: $userId');
                              hideLoading();
                              Get.off(() => const LoginPage());
                            } catch (e) {
                              hideLoading();
                              Get.snackbar('회원가입 실패', e.toString());
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xFF6FAF9B),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(161, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text(
                          '회원가입',
                          style: TextStyle(
                            fontFamily: 'SCDream',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          overlayColor: Colors.transparent,
                          padding: const EdgeInsets.only(top: 12),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          '돌아가기',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.grey,
                            decorationThickness: 1,
                            fontFamily: 'SCDream',
                            fontSize: 11,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
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
      ),
    );
  }
}
