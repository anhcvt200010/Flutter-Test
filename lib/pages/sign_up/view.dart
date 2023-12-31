import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import '../../common/notification/noti.dart';
import '../../common/styles/color.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 40,
        ),
      ),
      backgroundColor: Colors.blueAccent,
      body: SignUpView(),
    );
  }
}

class SignUpView extends StatefulWidget {

  SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final DateTime _selectedDate = DateTime.now();
  bool checkValidEmail = true;
  TextEditingController emailController = TextEditingController();
  String enteredEmail = '';

  bool isEmailValid(String email) {
    final emailRegExp = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );

    return emailRegExp.hasMatch(email);
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

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
                'Đăng ký',
                style: TextStyle(
                    fontFamily: 'Times New Roman',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 48),
              ),
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
                  "Tên người dùng",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: textColor2,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: 'Nhập tên người dùng',
                  isDense: true,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: textColor2,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: 'Nhập email',
                  isDense: true,
                ),
              ),
              if (!checkValidEmail)
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Email không đúng định dạng!!!!!!!",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              const SizedBox(height: 15),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Mật khẩu",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: textColor2,
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
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: 'Nhập mật khẩu',
                  isDense: true,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Ngày sinh",
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor2,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: ScrollDatePicker(
                  locale: const Locale('en'),
                  selectedDate: _selectedDate,
                  onDateTimeChanged: (DateTime value) {},
                ),
              ),
              const SizedBox(height: 25),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: primaryColor1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  if (this.isEmailValid(emailController.text)) {
                    setState(() {
                      checkValidEmail = true;
                    });
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return NotificationWidget(title: 'SUCCESS', content: 'Bạn đã đăng ký thành công, '
                              'bạn sẽ được tự động chuyển về trang đăng nhập', followPage: '/login',);
                      },
                    );
                  }
                  else {
                    setState(() {
                      checkValidEmail = false;
                    });
                  }
                },
                child: const Text(
                  'Đăng ký',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
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


