import 'package:flutter/material.dart';
import '/shared/widgets/navigation.dart';
import '../../shared/themes/theme.dart';
import '/config.dart';

class OfferDealPage extends StatefulWidget {
  @override
  _OfferDealPageState createState() => _OfferDealPageState();
}

class _OfferDealPageState extends State<OfferDealPage> {
  String dateRange = '';
  String firstCity = '';
  String secondCity = '';

  @override
  void initState() {
    super.initState();
    if (Config.MOCKUP) {
      setState(() {
        dateRange = '01.04.2024 - 02.04.2024';
        firstCity = 'Санкт-Петербург';
        secondCity = 'Новосибирск';
      });
    } else {
      // Загрузка данных с сервера
    }
  }

  void acceptDeal() {
    // TODO принятие сделки
    print('Сделка принята');
  }

  void declineDeal() {
    // TODO Отказ от сделки
    print('Сделка отклонена');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Сделка предложена'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Вам предложена сделка',
                style: TextStyles.mainHeadline,
              ),
              SizedBox(height: 20),
              _buildDealCard(context),
              SizedBox(height: 20),
              DefaultButton(
                onPressed: acceptDeal,
                text: 'Принять',
              ),
              SizedBox(height: 10),
              DefaultButton(
                onPressed: declineDeal,
                text: 'Отклонить',
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

  Widget _buildDealCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        title: Text('Предложение о сделке'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Даты: $dateRange',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                Navigator.of(context).pushNamed('/deal');
              },
              child: Text(
                'Подробнее о сделке',
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
