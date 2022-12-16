import 'dart:async';
import 'dart:convert';

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:subway_pro/main.dart';

String apiKey =
      "4fskVJh2CpFFANbJ0JCuuX0%2F90cRzEKtJAdFvkgjcZyq%2F6bd%2BWlBvJD8IZuwtFaTGK7ku4VvkcyJx05A9rK7cg%3D%3D";

Future<Subway> fetchSubway() async {
  final response = await http.get(Uri.parse('https://apis.data.go.kr/B553766/smt-path/path?serviceKey=$apiKey'));

  if (response.statusCode == 200) {
    return Subway.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Subway');
  }
}



class Subway{
  String? start_st; // 출발역
  String? end_st; // 도착역
  String? dept_time; // 출발시간
  String? arrv_time; // 도착시간
  String? time; // 소요시간
  String? week; // 요일
  String? transfer; // 환승횟수
  String? fee; // 운임정보 (요금)
  String? station_nm; // 경로 역사명
  String? line_num; // 호선 번호

  Subway({
    this.start_st,
    this.end_st,
    this.dept_time,
    this.arrv_time,
    this.time,
    this.week,
    this.transfer,
    this.fee,
    this.station_nm,
    this.line_num,
  });
  
  factory Subway.fromJson(Map<String, dynamic> json) {
    return Subway(
      start_st: json["start_st"],
      end_st: json["end_st"],
      dept_time: json["dept_time"],
      arrv_time: json["arrv_time"],
      time: json["cpTp"],
      week: json["csNm"],
      transfer: json["transfet"],
      fee: json["fee"],
      station_nm: json["station_nm"],
      line_num: json["line_num"],
    );
  }
} // class Subway

void main() => runApp(MyApp());

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  late Future<Subway> subway;
  

  @override
  void initState() {
    super.initState();
    subway = fetchSubway();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('공홈 json 예제 테스트'),
      ),
      body: Center(
        child: FutureBuilder<Subway>(
          future: subway,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Text(snapshot.data!.start_st!);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

}