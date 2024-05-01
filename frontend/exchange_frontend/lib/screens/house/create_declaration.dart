import 'package:flutter/material.dart';
import '../../shared/themes/theme.dart'; 

class CreateDeclarationPage extends StatelessWidget {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Создать новое объявление'),
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Создать новое объявление',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DefaultButton(
              onPressed: () {
                // Placeholder for photo uploading
              },
              text: 'Загрузить фото',
            ),
            SizedBox(height: 20),
            DefaultTextField(
              hintText: 'Дата',
              keyboardType: TextInputType.datetime,
              controller: _dateController,
            ),
            SizedBox(height: 20),
            DefaultTextField(
              hintText: 'Описание',
              controller: _descriptionController,
            ),
            SizedBox(height: 20),
            DefaultButton(
              onPressed: () {
                // Placeholder for submitting for moderation
                Navigator.of(context).pushNamed('/search-results');
              },
              text: 'На модерацию',
            ),
            SizedBox(height: 20),
            DefaultButton(
              onPressed: () {
                Navigator.pop(context);
              },
              text: 'Назад',
            ),
          ],
        ),
      ),
    );
  }
}
