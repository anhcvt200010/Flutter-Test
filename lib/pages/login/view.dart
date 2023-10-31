import 'package:flutter/material.dart';
import 'package:test_test/common/styles/color.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/R.jpg"),
                fit: BoxFit.fill
              )
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(top: 15.0, bottom: 40.0, left: 40.0, right: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: 'Phone or email',
                  labelStyle: TextStyle(
                    color: Colors.white60,
                    fontSize: 15,
                  )
                ),
              cursorColor: Colors.white,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.white60,
                    fontSize: 15,
                  ),
                ),
              cursorColor: Colors.white,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                minimumSize: MaterialStateProperty.all(Size(double.infinity, 30)),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                      'OR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child:
                ElevatedButton(
                  onPressed: () {
                      Navigator.pushNamed(context, '/register');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 30)),
                  ),
                  child: Text(
                      'Create New Facebook Account',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)
                  ),
                ),
            )
          ],
        ),
      );
    }
  }

