import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:subway_pro/subtest/sub.dart';
import 'package:http/http.dart' as http;
import 'package:subway_pro/screens/StationserchPage.dart';

class SubRepoitory {
  // api key
   var apiKey =
      "4fskVJh2CpFFANbJ0JCuuX0%2F90cRzEKtJAdFvkgjcZyq%2F6bd%2BWlBvJD8IZuwtFaTGK7ku4VvkcyJx05A9rK7cg%3D%3D";
    

  Future<List<Sub>?> loadSubs() async {
    
    var start_st = "어린이대공원";
    String baseUrl =
        "https://apis.data.go.kr/B553766/smt-path/path?serviceKey=$apiKey";    

    final response = await http.get(Uri.parse("https://apis.data.go.kr/B553766/smt-path/path?serviceKey=4fskVJh2CpFFANbJ0JCuuX0%2F90cRzEKtJAdFvkgjcZyq%2F6bd%2BWlBvJD8IZuwtFaTGK7ku4VvkcyJx05A9rK7cg%3D%3D&pageNo=1&numOfRows=10&dept_station_code=2728&dest_station_code=0214&week=DAY&search_type=FASTEST&dept_time=120001"));
    // "https://apis.data.go.kr/B553766/smt-path/path?serviceKey=4fskVJh2CpFFANbJ0JCuuX0%2F90cRzEKtJAdFvkgjcZyq%2F6bd%2BWlBvJD8IZuwtFaTGK7ku4VvkcyJx05A9rK7cg%3D%3D&pageNo=1&numOfRows=10&dept_station_code=2728&dest_station_code=0214&week=DAY&search_type=FASTEST&dept_time=120001"
    //  &pageNo=1&numOfRows=10&dept_station_code=2728&dest_station_code=0214&week=DAY&search_type=FASTEST&dept_time=120001
    
    // 정상적으로 데이터를 불러왔다면
    if (response.statusCode == 200) {

      // 데이터 가져오기
      var body = convert.utf8.decode(response.bodyBytes);
      print(body);

      // 필요한 데이터 찾기

      // Map<String, dynamic> json = jsonDecode(start_st);
      // Sub sub = Sub.fromJson(json);
      // Map<String, dynamic>jsonData = jsonDecode(jsonString);
      Map<String, dynamic> json = convert.json.decode as Map<String, dynamic>;
      final jsonSub = json['response']['body']['items'];
      Sub sub = Sub.fromJson(json);
    

      // 필요한 데이터 그룹이 있다면 
      if (jsonSub['item'] != null) {

        // map을 통해 데이터를 전달하기 위해 객체인 List로 만든다.
        List<dynamic> list = jsonSub['item']; 

        // map을 통해 Sub형태로 item을  => Sub.fromJson으로 전달
        return list.map<Sub>((item) => Sub.fromJson(item)).toList();


      }

    }
  }
}