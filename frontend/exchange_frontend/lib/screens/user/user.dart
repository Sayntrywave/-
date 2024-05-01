import 'package:flutter/material.dart';
import '../../shared/widgets/navigation.dart';
import '/config.dart';
import '../../shared/themes/theme.dart';

class UserProfilePage extends StatefulWidget {
  final String userId;
  UserProfilePage({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool isMockup = Config.MOCKUP;
  bool isOwner = false;
  bool isModerator = false;
  String userName = '';
  String userDescription = '';
  String userSocials = '';

  void loadData() {
    if (isMockup) {
      setState(() {
        userName = 'Тестовый пользователь Алёша';
        userDescription = 'Норм чел';
        userSocials = 'Социальные сети пользователя...';
      });
    } else {
      // TODO: Загрузка с сервера
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  userName,
                  style: TextStyles.mainHeadline,
                  textAlign: TextAlign.center,
                ),
                Icon(Icons.account_circle, size: 120),
                Text('Соцсети:', style: TextStyles.subHeadline),
                Text(userSocials, textAlign: TextAlign.center, style: TextStyles.mainText),
                Text('Описание:', style: TextStyles.subHeadline),
                Text(userDescription, textAlign: TextAlign.center, style: TextStyles.mainText),
                Text('Публикации:', style: TextStyles.subHeadline),
                Text('Отсутствуют', textAlign: TextAlign.center, style: TextStyles.mainText),
                Text('Комментарии:', style: TextStyles.subHeadline),
                Text('Отсутствуют', textAlign: TextAlign.center, style: TextStyles.mainText),
                if (!isOwner && !isModerator)
                  DefaultButton(
                    text: 'Редактировать',
                    onPressed: () {
                      Navigator.pushNamed(context, '/redact');
                    },
                  ),
                if (isOwner)
                  DefaultButton(
                    text: 'Редактировать',
                    onPressed: () {
                      Navigator.pushNamed(context, '/redact');
                    },
                  ),
                if (isModerator)
                  DefaultButton(
                    text: 'Блокировать',
                    onPressed: () {},
                  ),
                DefaultButton(
                  text: 'Назад',
                  onPressed: () {
                    Navigator.of(context). pop();
                  },
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
