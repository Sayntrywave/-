import 'package:flutter/material.dart';
import '/shared/widgets/navigation.dart';
import '../../shared/themes/theme.dart'; 
import '/config.dart'; 

class DealPage extends StatefulWidget {
  @override
  _DealPageState createState() => _DealPageState();
}

class _DealPageState extends State<DealPage> {
  String dateRange = '';
  String firstCity = '';
  String secondCity = '';

  @override
  void initState() {
    super.initState();
    if (Config.MOCKUP) {
      // Генерация мокаповых данных
      setState(() {
        dateRange = '15.03.2024 - 16.03.2024';
        firstCity = 'Омск';
        secondCity = 'Москва';
      });
    } else {
      // Получение данных с сервера
      // Ваш код здесь
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Предложение обмена',
                style: TextStyles.mainHeadline,
              ),
              SizedBox(height: 10),
              Text(
                'Дата: $dateRange',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Первый дом:',
                style: TextStyles.mainHeadline,
              ),
              SizedBox(height: 20),
              _buildHouseCard('', context),
              SizedBox(height: 20),
              Text(
                'Второй дом:',
                style: TextStyles.mainHeadline,
              ),
              _buildHouseCard('', context),
              SizedBox(height: 20),
              Text(
                'Отзывы отсутствуют',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              DefaultButton(
                onPressed: () {
                  // Действие
                },
                text: 'Действие',
              ),
              SizedBox(height: 20),
              DefaultButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Назад',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onItemSelected: (index) {},
      ),
    );
  }

  Widget _buildHouseCard(String title, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Города: $firstCity - $secondCity',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/declaration');
              },
              child: Text(
                'Объявление о доме',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
