import 'package:flutter/material.dart';
import 'package:majoong_notice/pages/auth/view_model/auth_view_model.dart';
import 'package:majoong_notice/pages/auth/widgets/email_verify_screen.dart';
import 'package:majoong_notice/pages/home_page/widgets/home_page.dart';

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
                    '성함',
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: 'SCDream',
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF424242).withOpacity(0.8),
                    ),
                  ),
                ),
                TextFormField(
                  controller: nameController,
                  cursorColor: Color(0xFF424242).withOpacity(0.8),
                  validator: viewModel.validateName,
                  decoration: InputDecoration(
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
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '역할',
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: 'SCDream',
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF424242).withOpacity(0.8),
                    ),
                  ),
                ), SizedBox(height: 10,),Align(
                      alignment: Alignment.centerRight,
                  child: Row(
                        children: ['개인 보호자', '요양원 종사자'].map((role) {
                          final isSelected = selectedRole == role;
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: GestureDetector(
                                onTap: () => setState(() => selectedRole = role),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: isSelected ? Color(0xFF6FAF9B) : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: isSelected ? Color(0xFF6FAF9B) : Colors.grey,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      role,
                                      style: TextStyle(
                                        color: isSelected ? Colors.white : Colors.grey,
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
                ), SizedBox(height: 50,),
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
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
              SizedBox(height: 20,),
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
                validator: (value) =>
                    viewModel.validatePasswordConfirm(
                      value,
                      passwordController.text,
                    ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
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
              SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {

                  if (selectedRole == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('역할을 선택해주세요')),
                    );
                    return;
                  }

                  if (_formKey.currentState!.validate()) {
                    print('검증 통과!');



                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          EmailVerifyScreen(email: emailController.text)),
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
                child: Text(
                  '회원가입',
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
    ),)
    ,
    );
  }
}
