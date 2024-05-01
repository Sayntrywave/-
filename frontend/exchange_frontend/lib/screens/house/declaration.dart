import 'package:flutter/material.dart';
import '/shared/widgets/navigation.dart';
import '/config.dart';
import '../../shared/themes/theme.dart'; 
//import '/screens/user/user.dart'; 

class DeclarationPage extends StatefulWidget {
  @override
  _DeclarationPageState createState() => _DeclarationPageState();
}

class _DeclarationPageState extends State<DeclarationPage> {
  bool isMockup = Config.MOCKUP;
  String title = '';
  List<String> imgList = [];
  String dateRange = '';
  String description = '';
  String userName = 'Имя пользователя';
  String userExplanation = 'Текстовое пояснение от автора';

  void loadData() {
    print("Загрузка данных начата");
    if (isMockup) {
      // Загрузка моковых данных
      setState(() {
        title = 'Жилье в г. Омск';
        imgList = [
          'assets/image1.jpg',
          'assets/image2.jpg',
          'assets/image3.jpg',
        ];
        dateRange = '01.01.2022 - 02.01.2022';
        description = 'Длинное описание жилья, его характеристики, преимущества и прочая информация.';
      });
    } else {
      // TODO работа с сервером
    }
  }

  @override
  void initState() {
    super.initState();
    print("initState called");
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyles.mainHeadline,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  dateRange,
                  style: TextStyles.subHeadline,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Текстовое описание',
                  style: TextStyles.subHeadline,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                ),
              ),
              ListTile(
                leading: InkWell(
                  onTap: () {
                    // Переход на экран пользователя
                    Navigator.pushReplacementNamed(context, '/user');
                  },
                  child: CircleAvatar(),
                ),
                title: InkWell(
                  onTap: () {
                    // Переход на экран пользователя
                    Navigator.pushReplacementNamed(context, '/user');
                  },
                  child: Text(userName, textAlign: TextAlign.center),
                ),
                subtitle: Text(userExplanation, textAlign: TextAlign.center),
              ),
              DefaultButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/search-results');
                },
                text: 'Откликнуться',
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
