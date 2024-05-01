import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../shared/themes/theme.dart'; 

class AuthorizationPage extends StatefulWidget {
  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  //final TextEditingController _emailController = TextEditingController();
  //final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // TODO Допилить стили, padding убрать
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/images/logo.svg',
                    height: screenHeight * 0.2, 
                  ),
                  Text(
                    'МЕНЯЙСЯ!',
                    style: TextStyles.mainHeadline,
                    textAlign: TextAlign.center,
                  ),
                  /*DefaultTextField(
                    hintText: 'Email',
                    controller: _emailController,
                    onSubmitted: (value) {
                      // TODO: Handle submission
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  DefaultTextField(
                    hintText: 'Password',
                    controller: _passwordController,
                    onSubmitted: (value) {
                      // TODO: Handle submission
                    },
                  ),*/
                  SizedBox(height: screenHeight * 0.05),
                  DefaultButton(
                    text: 'Регистрация',
                    onPressed: () => Navigator.pushNamed(context, '/registration'),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  DefaultButton(
                    text: 'Вход',
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  DefaultButton(
                    text: 'Войти как гость',
                    onPressed: () => Navigator.pushNamed(context, '/guest'),
                  ),
                  DefaultButton(
                    text: '[TEST] Войти как модератор',
                    onPressed: () => Navigator.pushNamed(context, '/moder_profile'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

