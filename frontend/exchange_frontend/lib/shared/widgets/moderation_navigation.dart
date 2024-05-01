import 'package:flutter/material.dart';
import '/shared/themes/theme.dart';

class ModerBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  ModerBottomNavigationBar({
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onItemSelected,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: AppColors.background),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: _buildExclamationIcon(),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list, color: AppColors.background),
          label: '',
        ),
      ],
      backgroundColor: AppColors.primary,
      unselectedItemColor: AppColors.background.withOpacity(0.60),
      selectedItemColor: AppColors.background,
      type: BottomNavigationBarType.fixed,
    );
  }

  Widget _buildExclamationIcon() {
    return Stack(
      children: [
        Icon(Icons.notifications, color: AppColors.background),
        Positioned(
          right: 0,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              '!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
