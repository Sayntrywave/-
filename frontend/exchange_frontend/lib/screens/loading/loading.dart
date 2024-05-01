import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../shared/themes/theme.dart'; 
import 'dart:async';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    checkAppStatus();
  }

  void checkAppStatus() async {
    // Проверяем значение флага MOCKUP
    const bool mockup = bool.fromEnvironment('MOCKUP', defaultValue: false);

    if (!mockup) {
      // TODO: Реальная проверка статуса приложения
      await Future.delayed(Duration(seconds: 10)); // Задержка для демонстрации
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/authorization');
      }
    } else {
      await Future.delayed(Duration(seconds: 3));
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/authorization');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Это метод build для _LoadingPageState
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset('assets/images/logo.svg', width: MediaQuery.of(context).size.width), // Логотип на всю ширину????????????
          SizedBox(height: 20), 
          Text('МЕНЯЙСЯ!', style: TextStyles.mainHeadline),
          SizedBox(height: 10), 
          Text('Загрузка...', style: TextStyles.subText), 
        ],
      ),
    );
  }
}
