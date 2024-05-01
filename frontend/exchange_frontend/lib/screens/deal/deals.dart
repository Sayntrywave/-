import 'package:flutter/material.dart';
import '/shared/widgets/navigation.dart';
import '../../shared/themes/theme.dart'; 
//import '../deal/deal.dart'; 

class ActiveDealsPage extends StatefulWidget {
  @override
  _ActiveDealsPageState createState() => _ActiveDealsPageState();
}

class _ActiveDealsPageState extends State<ActiveDealsPage> {
  List<Map<String, dynamic>> myDealsData = [];
  List<Map<String, dynamic>> completedDealsData = [];

  @override
  void initState() {
    super.initState();
    loadActiveDeals();
  }

  void loadActiveDeals() {
    myDealsData = List.generate(3, (index) {
      return {
        "dealTitle": "Моя сделка ${index + 1}",
        "dealDateRange": "01.01.2023 - 02.02.2023",
        "dealIcon": Icons.business_center,
      };
    });

    completedDealsData = List.generate(3, (index) {
      return {
        "dealTitle": "Завершенная сделка ${index + 1}",
        "dealDateRange": "01.01.2023 - 02.02.2023",
        "dealIcon": Icons.check_circle_outline,
      };
    });
  }

  Widget buildDealList(List<Map<String, dynamic>> deals, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyles.mainHeadline,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            itemCount: deals.length,
            itemBuilder: (context, index) {
              var deal = deals[index];
              return InkWell(
                onTap: () {
                  print("Tapped on deal: ${deal["dealTitle"]}");
                  Navigator.of(context).pushNamed('/deal'); 
                },

                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    title: Text(deal["dealTitle"]),
                    subtitle: Text(deal["dealDateRange"]),
                    trailing: Icon(deal["dealIcon"]),
                    onTap: () {
                      // Handle tap
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildDealList(myDealsData, "Мои сделки:"),
            buildDealList(completedDealsData, "Завершенные сделки:"),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
        onItemSelected: (index) {
          // Handle navigation item taps
        },
      ),
    );
  }
}
