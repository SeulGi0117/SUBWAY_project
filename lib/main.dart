// main.dart
//

import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:subway_pro/screens/StationCode.dart';
import 'package:subway_pro/screens/HomePage.dart';
import 'package:subway_pro/screens/StationserchPage.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SubwayMap',
      theme: ThemeData(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Text('메인홈페이지')),
                Tab(icon: Text('역 검색')),
                Tab(icon: Text('역 코드로 지하철 경로 검색')),
              ],
            ),
            title: const Text('지하철 노선도'),
          ),
          body: TabBarView(
            children: <Widget>[
              Homepage(),
              StationserchPage(),
              StationCode(),
            ],
          ),
        ),
      ),
    );
  }
}
