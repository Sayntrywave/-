import 'package:flutter/material.dart';
import '/shared/themes/theme.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        onItemSelected(index);
        switch (index) {
          case 0: // Переход на страницу пользователя
            Navigator.pushNamed(context, '/user', arguments: {'isOwner': true});
            break;
          case 1: // Переход на страницу поиска
            Navigator.pushNamed(context, '/filters');
            break;
          case 2: // Переход на страницу активных сделом
            Navigator.pushNamed(context, '/deals');
            break;
          case 3: // Переход на страницу активных сделом
            Navigator.pushNamed(context, '/notifications');
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: AppColors.background),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, color: AppColors.background),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check_circle, color: AppColors.background),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications, color: AppColors.background),
          label: '',
        ),
      ],
      backgroundColor: AppColors.primary,
      unselectedItemColor: AppColors.background.withOpacity(0.60), 
      selectedItemColor: AppColors.background, 
      type: BottomNavigationBarType.fixed, 
    );
  }
}
