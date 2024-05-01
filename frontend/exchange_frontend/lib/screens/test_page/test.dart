import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = '';
  static const String _baseApiUrl = 'http://82.148.29.11:8080/api';
  static const String _token = 'tokenblablabla';

  Future<void> _getPublicMessage() async {
  final response = await http.get(Uri.parse('http://82.148.29.11:8080/api/hello'));

  if (response.statusCode == 200) {
    if (response.body.startsWith('{') || response.body.startsWith('[')) {
      try {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse is Map<String, dynamic> && jsonResponse['message'] != null) {
          setState(() {
            _message = jsonResponse['message'];
          });
        } else {
          setState(() {
            _message = 'JSON не содержит ключа "message".';
          });
        }
      } catch (e) {
        setState(() {
          _message = 'Ошибка при декодировании JSON: $e';
        });
      }
    } else {
      setState(() {
        _message = response.body;
      });
    }
  } else {
    setState(() {
      _message = 'Ошибка получения данных: ${response.statusCode}';
    });
  }
}


  Future<void> _getSecureMessage() async {
    final response = await http.get(
      Uri.parse('$_baseApiUrl/secureHello'),
      headers: {'token': _token},
    );

    if (response.statusCode == 200) {
      setState(() {
        _message = json.decode(response.body)['message'];
      });
    } else {
      setState(() {
        _message = 'Ошибка авторизации: ${response.statusCode}';
      });
    }
  }

  Future<void> _postMessage() async {
    final response = await http.post(
      Uri.parse('$_baseApiUrl/hello'),
      headers: {
        'Content-Type': 'application/json',
        'token': _token,
      },
      body: json.encode({'message': 'Ok, im a Sanyok. So what?'}),
    );

    if (response.statusCode == 200) {
      setState(() {
        _message = json.decode(response.body)['message'];
      });
    } else {
      setState(() {
        _message = 'Ошибка отправки данных: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter API Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _message,
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 20), 
            ElevatedButton(
              onPressed: _getPublicMessage,
              child: Text('Получить публичное сообщение'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getSecureMessage,
              child: Text('Получить защищенное сообщение'),
            ),
            SizedBox(height: 20), 
            ElevatedButton(
              onPressed: _postMessage,
              child: Text('Отправить POST запрос'),
            ),
          ],
        ),
      ),
    );
  }
}
