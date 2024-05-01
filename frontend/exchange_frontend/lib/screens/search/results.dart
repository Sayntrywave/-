import 'package:flutter/material.dart';
import '/shared/widgets/navigation.dart';
//import 'package:country_picker/country_picker.dart';
import '/config.dart';
import '/screens/house/declaration.dart'; 
import '../../shared/themes/theme.dart'; 

class SearchResultsPage extends StatefulWidget {
  final String? selectedCity;
  final DateTimeRange? dateRange;

  SearchResultsPage({Key? key, this.selectedCity, this.dateRange}) : super(key: key);

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  int _selectedIndex = 1;
  List<Map<String, dynamic>> mockData = []; 

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            'Результаты поиска',
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeclarationPage(),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 80), 
            child: DefaultButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/filters');
              },
              text: 'Фильтры поиска',
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
