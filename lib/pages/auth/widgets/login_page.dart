import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majoong_notice/components/loading_overlay.dart';
import 'package:majoong_notice/pages/auth/view_model/auth_view_model.dart';
import 'package:majoong_notice/pages/auth/widgets/find_password_page.dart';
import 'package:majoong_notice/pages/auth/widgets/sign_up_page.dart';
import 'package:majoong_notice/pages/home_page/widgets/home_page.dart';
import 'package:majoong_notice/services/http/user/user_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final viewModel = AuthViewModel();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                        '이메일',
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'SCDream',
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF424242).withOpacity(0.8),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      cursorColor: Color(0xFF424242).withOpacity(0.8),
                      validator: viewModel.validateEmail,
                      decoration: InputDecoration(
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
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '비밀번호',
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
                      decoration: InputDecoration(
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
                    SizedBox(height: 60),
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _autovalidateMode = AutovalidateMode.onUserInteraction;  // 버튼 누르면 켬
                        });
                        if (_formKey.currentState!.validate()) {
                          showLoading();
                          try {
                            await login(
                              email: emailController.text.trim(),
                              password: passwordController.text,
                            );
                            hideLoading();
                            Get.off(() => const HomePage());
                          } catch (e) {
                            hideLoading();
                            Get.snackbar('로그인 실패', e.toString());
                          }
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
                        '로그인',
                        style: TextStyle(
                          fontFamily: 'SCDream',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          color: Color(0xFF6FAF9B),
                          width: 1,
                        ),
                        elevation: 0,
                        backgroundColor: Color(0xFFF6FAF8),
                        foregroundColor: Color(0xFF6FAF9B),
                        minimumSize: Size(161, 40),
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
                          MaterialPageRoute(builder: (context) => const FindPasswordPage()),
                        );
                      },
                      style: TextButton.styleFrom(overlayColor: Colors.transparent,padding: EdgeInsets.only(top: 12),minimumSize: Size.zero,tapTargetSize: MaterialTapTargetSize.shrinkWrap,),
                      child: const Text(
                        '비밀번호 찾기',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                            decorationColor: Colors.grey,
                            decorationThickness: 1,
                            fontFamily: 'SCDream',
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey
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
