import 'package:flutter/material.dart';
import '../../shared/themes/theme.dart';
import '/shared/widgets/navigation.dart';
import '/config.dart';

class CreateReviewPage extends StatefulWidget {
  @override
  _CreateReviewPageState createState() => _CreateReviewPageState();
}

class _CreateReviewPageState extends State<CreateReviewPage> {
  int _selectedIndex = 1;  

  Map<String, dynamic> dealData = {};

  @override
  void initState() {
    super.initState();
    loadDealData();
  }

  void loadDealData() {
    if (Config.MOCKUP) {
      dealData = {
        "icon": Icons.swap_horiz,
        "cities": ["Москва", "Санкт-Петербург"],
        "people": ["Иван Иванов", "Петр Петров"],
      };
    } else {
      // Загрузка данных с сервера
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Создать отзыв'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Сделка:', style: TextStyles.mainHeadline),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/deal');
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(dealData['icon'], size: 50), 
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${dealData['cities'][0]} - ${dealData['cities'][1]}', style: TextStyles.subHeadline),
                          Text('${dealData['people'][0]} и ${dealData['people'][1]}', style: TextStyles.mainText),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Отзыв:', style: TextStyles.mainHeadline),
              Text('Отличная сделка! Всё прошло гладко.', style: TextStyles.mainText),
              SizedBox(height: 20),
              DefaultButton(
                // TODO в зависимости от типа ползователя
                text: 'Жалоба/удаление',
                onPressed: () {
                  // Добавить обработку
                  Navigator.of(context).pushNamed('/search-results');
                },
              ),
              SizedBox(height: 10),
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
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
