// УРЕЗАННАЯ ВЕРСИЯ!
// Метрика не интегрирована

import 'package:flutter/material.dart';
//import 'screens/test_page/test.dart';
import 'screens/loading/loading.dart';
//import 'shared/themes/theme.dart';
import 'screens/authorization/authorization.dart';
import 'screens/authorization/registration.dart';
import 'screens/authorization/login.dart';
import 'screens/search/results.dart';
import 'screens/search/filters.dart';
import '/screens/house/declaration.dart'; 
import '/screens/house/create_declaration.dart'; 
import '/screens/user/user.dart'; 
import '/screens/user/redact.dart'; 
import '/screens/deal/deals.dart'; 
import '/screens/deal/deal.dart'; 
import '/screens/deal/notifications.dart'; 

import '/screens/moderation/profile.dart'; 
import '/screens/moderation/reports.dart'; 
import '/screens/moderation/premoderation_list.dart';


void main() {

  // TODO init
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'МЕНЯЙСЯ!',
      //theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingPage(), 
        '/authorization': (context) => AuthorizationPage(),
        '/registration': (context) => RegistrationPage(),
        '/login': (context) => LoginPage(),
        '/guest': (context) => SearchResultsPage(),
        '/search-results': (context) => SearchResultsPage(),
        '/filters': (context) => FiltersPage(),
        '/declaration': (context) => DeclarationPage(),
        '/create_declaration': (context) => CreateDeclarationPage(),
        '/redact': (context) => RedactProfilePage(),
        '/deals': (context) => ActiveDealsPage(),
        '/user': (context) => UserProfilePage(userId: 'id_here'),
        '/notifications': (context) => NotificationsPage(),
        '/deal': (context) => DealPage(),


        // Moderation
        '/moder_profile': (context) => ModerProfilePage(),
        '/moder_reports': (context) => ModerReportsPage(),
        '/premoderation_list': (context) => PremoderationListPage(),
      },
    );
  }
}


