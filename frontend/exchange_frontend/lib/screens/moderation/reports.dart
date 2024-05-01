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

//TODO ВЫНЕСТИ В ФУТЕР

class ModerReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Жалобы:',
              textAlign: TextAlign.center,
              style: TextStyles.mainHeadline,
            ),
            SizedBox(height: 20),

            ListView.builder(
              shrinkWrap: true,
              itemCount: 5, 
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'Отзыв/профиль от <ИМЯ>', // TODO загружать с сервера
                    style: TextStyles.mainText,
                  ),

                  onTap: () {
                    // TODO ЗДЕСЬ ПРОВЕРКА ЖАЛОБА НА ОТЗЫВ ИЛИ НА ПРОФИЛЬ
                    if(true) {
                        //Если на профиль, то переход с ключом модератора на /user
                    } else {
                      //Если на профиль, то переход с ключом модератора на /review

                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: ModerBottomNavigationBar(
        currentIndex: 1,
        onItemSelected: (index) {
          switch (index) {
            case 0:
              Navigator.of(context).pushNamed('/moder_profile');
              break;
            case 1:
              Navigator.of(context).pushNamed('/moder_reports');
              break;
            case 2:
              Navigator.of(context).pushNamed('/premoderation_list');
              break;
          }
        },
      ),
    );
  }
}
