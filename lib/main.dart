import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'model/model.dart';

var logger = Logger();
List<Country> memleket = [];

Future<String> loadData() async {
  return await rootBundle.loadString(("lib/data/data.json"));
}

Future loadDataParse() async {
  String stringData = await loadData();
  final jsonResponse = json.decode(stringData);
  Country sehirler = Country.fromJson(jsonResponse);
  logger.d(sehirler.ilce);
  
}

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  loadDataParse();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final Country sehirler;

  const MyApp({this.sehirler});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text("hello"),
          ),
        ),
      ),
    );
  }
}
