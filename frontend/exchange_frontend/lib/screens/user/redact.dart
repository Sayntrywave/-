import 'package:flutter/material.dart';
import '/shared/widgets/navigation.dart';
import '/shared/themes/theme.dart'; 

class RedactProfilePage extends StatefulWidget {
  @override
  _RedactProfilePageState createState() => _RedactProfilePageState();
}

class _RedactProfilePageState extends State<RedactProfilePage> {
  final TextEditingController _infoController = TextEditingController();
  final TextEditingController _socialsController = TextEditingController();

  @override
  void dispose() {
    _infoController.dispose();
    _socialsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Редактировать информацию о себе",
                  style: TextStyles.mainHeadline,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _infoController,
                  decoration: InputDecoration(
                    labelText: "Информация о себе",
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Редактировать социальные сети",
                  style: TextStyles.mainHeadline,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _socialsController,
                  decoration: InputDecoration(
                    labelText: "Социальные сети",
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: DefaultButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/user');
                  },
                  text: 'Подтвердить',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: DefaultButton(
                  onPressed: () {
                    Navigator.of(context).pop(); 
                  },
                  text: 'Назад',
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
        onItemSelected: (index) {},
      ),
    );
  }
}
