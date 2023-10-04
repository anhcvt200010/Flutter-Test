import 'package:flutter/material.dart';
import 'package:test_test/common/styles/color.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
      ),
      backgroundColor: Colors.pink[100],
      body: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 20),
          child: const Column(
            children: [
              Text(
                'hello!',
                style: TextStyle(
                    fontFamily: 'Times New Roman',
                    color: primaryColor1,
                    fontWeight: FontWeight.bold,
                    fontSize: 48),
              ),
              Text('hello!',
                  style: TextStyle(
                      fontFamily: 'Times New Roman',
                      color: primaryColor2,
                      fontWeight: FontWeight.bold,
                      fontSize: 48)),
            ],
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.only(bottom: 80, left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor1,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: 'Nhập email',
                  isDense: true,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Mật khẩu",
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor1,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: 'Nhập mật khẩu',
                  isDense: true,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Chưa có tài khoản?",
                    style: TextStyle(
                      fontSize: 14,
                      color: textColor1,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      'Đăng ký',
                      style: TextStyle(
                        fontSize: 14,
                        color: textColor1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide.none,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: const Text(
                  'Đăng nhập',
                  style: TextStyle(
                    fontSize: 16,
                    color: primaryColor2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
