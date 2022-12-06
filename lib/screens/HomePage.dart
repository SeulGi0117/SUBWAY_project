// Homepage.dart
import 'package:flutter/material.dart';
import 'package:subway_pro/screens/StationserchPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final String url = "apis.data.go.kr";
    final String path = "/B553766/smt-path/path";
    http.get(
        Uri.parse(
            "https://apis.data.go.kr/B553766/smt-path/path?serviceKey=4fskVJh2CpFFANbJ0JCuuX0%2F90cRzEKtJAdFvkgjcZyq%2F6bd%2BWlBvJD8IZuwtFaTGK7ku4VvkcyJx05A9rK7cg%3D%3D&pageNo=1&numOfRows=10&dept_station_code=2728&dest_station_code=0214&week=DAY&search_type=FASTEST&dept_time=120001"),
        headers: {"Accept": "application/json"}).then(((value) {
      var content = jsonDecode(utf8.decode(value.bodyBytes));
      print(content['data']['route']);
    }));

    return Scaffold(
        appBar: AppBar(
          title: const Text('지하철 노선도'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 2, //비율차지
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.subway,
                          size: 50,
                        ),
                        const Text(
                          '지하철 노선도 검색',
                          style: TextStyle(fontSize: 30),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: '역 이름을 입력해 주세요.',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                )),
                            maxLength: 10,
                          ),
                        ),
                        TextButton.icon(
                          //버튼
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => StationserchPage()),
                            );
                          },
                          icon: const Icon(
                            Icons.search,
                            size: 40,
                            color: Colors.black,
                          ),

                          // ignore: prefer_const_constructors
                          label: Text('경로 찾기',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black)),
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              // ignore: deprecated_member_use
                              primary: Colors.white,
                              minimumSize: Size(200, 50),
                              // ignore: deprecated_member_use
                              onSurface: Colors.white),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 3,
                  child: Image.asset('images/img_subway.png'),
                )
              ],
            ),
          ),
        ));
  }
}
