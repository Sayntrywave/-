import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../shared/themes/theme.dart'; 

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void register() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (_validatePassword(password)) {
      // TODO логика обработки
      print('Регистрация: Email: $email Password: $password');
      
      // Если позитивный сценарий:
      Navigator.of(context).pushNamed('/search-results');
    } else {
      // Пароль слишком слабый
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Ошибка'),
          content: Text('Пароль должен быть минимум 8 символов, содержать цифры и буквы обоих регистров.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop(); 
              },
              child: Text('ОК'),
            ),
          ],
        ),
      );
    }
  }

  bool _validatePassword(String password) {
    if (password.length < 8) {
      return false;
    }
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasUpper = password.contains(new RegExp(r'[A-Z]'));
    bool hasLower = password.contains(new RegExp(r'[a-z]'));
    return hasDigits && hasUpper && hasLower;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/logo.svg',
              ),
              SizedBox(height: 32),
              DefaultTextField(
                hintText: 'Электронная почта',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              DefaultTextField(
                hintText: 'Пароль',
                controller: _passwordController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onSubmitted: (value) => register(),
              ),
              SizedBox(height: 32),
              DefaultButton(
                text: 'Регистрация',
                onPressed: register,
              ),
              SizedBox(height: 16),
              DefaultButton(
                text: 'Назад',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
