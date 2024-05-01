import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../shared/themes/theme.dart'; 

class ConfirmPage extends StatefulWidget {
  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;


    //TODO убрать все SizedBox
    return Scaffold(
      /*
      appBar: AppBar(
        title: Text('Подтверждение'),
        leading: BackButton(),
      ),
      */
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/logo.svg',
                height: screenHeight * 0.2,
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                'На указанную электронную почту отправлен код, введите его ниже:',
                textAlign: TextAlign.center,
                style: TextStyles.subHeadline,
              ),
              SizedBox(height: 20),
              DefaultTextField(
                hintText: 'Код',
                controller: _codeController,
                keyboardType: TextInputType.number,
                onSubmitted: (value) {
                  // TODO: обработка кода
                },
              ),
              SizedBox(height: screenHeight * 0.05),
              DefaultButton(
                text: 'Подтвердить',
                onPressed: () {
                  // TODO: обработка подтверждения
                  Navigator.of(context).pushNamed('/search-results');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

