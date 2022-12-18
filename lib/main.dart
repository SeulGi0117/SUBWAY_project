// mian.dart
// import 'dart:html';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subway_pro/screens/HomePage.dart';
import 'package:subway_pro/screens/StationserchPage.dart';

import 'package:http/http.dart' as http;
import 'package:subway_pro/screens/subHome.dart';
import 'package:subway_pro/screens/testscreens.dart';
import 'package:subway_pro/subtest/sub_provider.dart';
import 'package:subway_pro/subtest/sub_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final String url = "apis.data.go.kr";
    // final String path = "/B553766/smt-path/path";
    // //pageNo=1&numOfRows=10&dept_station_code=2728&dest_station_code=0214&week=DAY&search_type=FASTEST&dept_time=120001";

    // // http
    // //     .get(Uri.https(url, path, {
    // //   'serviceKey':
    // //       '4fskVJh2CpFFANbJ0JCuuX0%2F90cRzEKtJAdFvkgjcZyq%2F6bd%2BWlBvJD8IZuwtFaTGK7ku4VvkcyJx05A9rK7cg%3D%3D',
    // //   'pageNo': '1',
    // //   'numOfRows': '10',
    // //   'dept_station_code': '2728',
    // //   'dest_station_code': '0214',
    // //   'week': 'DAY',
    // //   'search_type': 'FASTEST',
    // //   'dept_time': '120001',
    // // }))
    // //     .then(((value) {
    // //   print(value.body);
    // // }));
    // http.get(
    //     Uri.parse(
    //         "https://apis.data.go.kr/B553766/smt-path/path?serviceKey=4fskVJh2CpFFANbJ0JCuuX0%2F90cRzEKtJAdFvkgjcZyq%2F6bd%2BWlBvJD8IZuwtFaTGK7ku4VvkcyJx05A9rK7cg%3D%3D&pageNo=1&numOfRows=10&dept_station_code=2728&dest_station_code=0214&week=DAY&search_type=FASTEST&dept_time=120001"),
    //     headers: {"Accept": "application/json"}).then(((value) {
    //   var content = jsonDecode(utf8.decode(value.bodyBytes));
    //   print(content['data']['route']);
    // }));
    return MultiProvider (
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => SubProvider()),
        Provider(create: (_) => SubRepoitory()),
      ],
      // child: Home(),
      builder: (context, child) {
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
                Tab(icon: Text('provider test')),
                Tab(icon: Text('testscreens test')),
                // Tab(icon: Text('testscreecs')),
              ],
            ),
            title: const Text('지하철 노선도'),
          ),
          body: TabBarView(
            children: <Widget>[
              Homepage(),
              StationserchPage(),
              Home(),
              testscreens(),
              // testscreens(),

            ],
          ),
        ),
      ),
    );
      },
    );
  }
}