import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/shared/themes/theme.dart'; 

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void handleLogin() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // TODO добавить обработку
    print('Email: $email');
    print('Password: $password');

    // Если позитивный сценарий:
    Navigator.of(context).pushNamed('/search-results');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/logo.svg',
              ),
              SizedBox(height: 32),
              Text(
                'Вход',
                style: TextStyles.subHeadline,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              DefaultTextField(
                hintText: 'E-Mail',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              DefaultTextField(
                hintText: 'Пароль',
                controller: _passwordController,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 32),
              DefaultButton(
                text: 'Войти',
                onPressed: handleLogin,
              ),
              SizedBox(height: 16),
              DefaultButton(
                text: 'Назад',
                onPressed: () {
                  Navigator.of(context).pushNamed('/authorization');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
