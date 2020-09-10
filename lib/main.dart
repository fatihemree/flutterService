import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'model/model.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDataParse.then((value) {
      for (var item in value) {
        print(item.toJson() );
        
      }
    });
    // print(sehirler[0].ilce);
  }

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
            child: Text("fffff"),
          ),
        ),
      ),
    );
  }

  Future<String> get loadData async {
    return await rootBundle.loadString(("lib/data/data.json"));
  }

  Future<List<Country>> get loadDataParse async {
    String stringData = await loadData;
    List jsonResponse = jsonDecode(stringData);
    return jsonResponse.map((e) => Country.fromJson(e)).toList();
  }
}
