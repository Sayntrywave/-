import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart'; 
import '/shared/widgets/navigation.dart'; 
import '/screens/search/results.dart';
import '../../shared/themes/theme.dart'; 

class FiltersPage extends StatefulWidget {
  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  DateTimeRange? dateRange;
  String? selectedCity;
  TextEditingController cityController = TextEditingController();

  String getFromToDate() {
    if (dateRange == null) {
      return 'Выбрать';
    } else {
      final from = DateFormat('dd/MM/yyyy').format(dateRange!.start);
      final to = DateFormat('dd/MM/yyyy').format(dateRange!.end);
      return '$from - $to';
    }
  }

  void _showCityPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Выбор города'),
        actions: <Widget>[
          // Временная замена нормального виджета
          // ==============================================================
          CupertinoActionSheetAction(
            child: const Text('Москва'),
            onPressed: () {
              setState(() { selectedCity = 'Москва'; });
              Navigator.pop(context);
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Санкт-Петербург'),
            onPressed: () {
              setState(() { selectedCity = 'Санкт-Петербург'; });
              Navigator.pop(context);
            },
          ),
          // ==============================================================
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Отмена'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDateRange: dateRange,
    );
    if (picked != null && picked != dateRange) {
      setState(() {
        dateRange = picked;
      });
    }
  }

  void _applyFiltersAndNavigate() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultsPage(
          selectedCity: selectedCity,
          dateRange: dateRange,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: <Widget>[
                SizedBox(height: 32),
                Text(
                  'Фильтры поиска',
                  style: TextStyles.mainHeadline,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                Text(
                  'Желаемая Локация',
                  style: TextStyles.subHeadline,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: selectedCity ?? 'Выбрать город',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.location_city),
                      onPressed: _showCityPicker,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Время пребывания',
                  style: TextStyles.subHeadline,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: getFromToDate(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDateRange(context),
                    ),
                  ),
                ),
                SizedBox(height: 16),
          DefaultButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/search-results');
            },
            text: 'Применить',
          ),
          DefaultButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/create_declaration');
            },
            text: '+ СОЗДАТЬ',
          ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
        onItemSelected: (index) {
          //
        },
      ),
    );
  }
}
