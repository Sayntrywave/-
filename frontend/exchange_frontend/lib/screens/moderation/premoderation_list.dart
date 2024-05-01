import 'package:flutter/material.dart';
import '/shared/themes/theme.dart';
import '/config.dart';

class PremoderationListPage extends StatefulWidget {
  @override
  _PremoderationListPageState createState() => _PremoderationListPageState();
}

class _PremoderationListPageState extends State<PremoderationListPage> {
  List<Map<String, dynamic>> mockData = [];

  void loadDataWithFilters() {
    if (Config.MOCKUP) {
      mockData = List.generate(5, (index) {
        return {
          "city": "Город ${index + 1}",
          "dateRange": "01.01.2022 - 02.01.2022",
          "imageIcon": Icons.location_city
        };
      });
    } else {
      // Загрузка данных, основываясь на фильтрах
    }
  }

  @override
  void initState() {
    super.initState();
    loadDataWithFilters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Объявления, ожидающие премодерации:',
            style: TextStyles.mainHeadline,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mockData.length,
              itemBuilder: (context, index) {
                var item = mockData[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    title: Text(item["city"]),
                    subtitle: Text(item["dateRange"]),
                    trailing: Icon(item["imageIcon"]),
                    onTap: () {
                      print("ListTile tapped, navigating to DeclarationPage");
                      // TODO: Добавить навигацию к следующей странице
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

