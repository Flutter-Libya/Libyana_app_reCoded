import 'package:flutter/material.dart';
import 'login_form.dart';
import 'registration_form.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _controller = PageController();
  var _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
       
          children: [
            Image.asset('assets/logo.png', scale: 2),
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 600),
                  child: PageView(
                    controller: _controller,
                    onPageChanged: (value) {
                      setState(() {
                        _isLogin = value == 0;
                      });
                    },
                    children: [
                      LoginForm(),
                      RegistrationForm(),
                    ],
                  ),
                ),
              ),
            ),
            Image.asset('assets/1.png'),
            GestureDetector(
              onTap: () {
                _controller.animateToPage(_isLogin ? 1 : 0,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
              child: Text(
                _isLogin
                    ? 'Don\'t have an account? Sign up!'
                    : 'Already have an account? Sign in!',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
