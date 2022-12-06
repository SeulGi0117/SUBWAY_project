// mian.dart
import 'package:flutter/material.dart';
import 'package:subway_pro/screens/HomePage.dart';
import 'package:subway_pro/screens/StationsearchPage.dart';
import 'package:subway_pro/screens/FavoritesPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '지하철 노선도',
      theme: ThemeData(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Text('메인홈페이지')),
                Tab(icon: Text('역 검색')),
                Tab(icon: Text('경로 즐겨찾기')),
              ],
            ),
            title: const Text('지하철 노선도'),
          ),
          body: const TabBarView(
            children: <Widget>[
              Homepage(),
              StationserchPage(),
              Favorites(),
            ],
          ),
        ),
      ),
    );
  }
}
