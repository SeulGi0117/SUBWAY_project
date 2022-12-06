// mian.dart
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:subway_pro/screens/HomePage.dart';
import 'package:subway_pro/screens/StationserchPage.dart';

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
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Text('메인홈페이지')),
                Tab(icon: Text('역 검색')),
                Tab(icon: Text('경로 즐겨찾기')),
                Tab(icon: Text('임시 2')),
              ],
            ),
            title: const Text('지하철 노선도'),
          ),
          body: TabBarView(
            children: <Widget>[
              Homepage(),
              StationserchPage(),
            ],
          ),
        ),
      ),
    );
  }
}
