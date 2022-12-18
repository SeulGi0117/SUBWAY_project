import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:subway_pro/subtest/sub.dart';
import 'package:http/http.dart' as http;
import 'package:subway_pro/screens/StationserchPage.dart';

class SubRepoitory {
  // api key
  var apiKey =
      "4fskVJh2CpFFANbJ0JCuuX0%2F90cRzEKtJAdFvkgjcZyq%2F6bd%2BWlBvJD8IZuwtFaTGK7ku4VvkcyJx05A9rK7cg%3D%3D";

  Future<List<dynamic>?> loadSubs() async {
    // var start_st = "어린이대공원";
    String? st_num = "0150";
    String? ar_num = "0151";

    String baseUrl =
        "https://apis.data.go.kr/B553766/smt-path/path?serviceKey=$apiKey&pageNo=1&numOfRows=10&dept_station_code=${st_num}&dest_station_code=${ar_num}&week=DAY&search_type=FASTEST&dept_time=120001";

    final response = await http.get(Uri.parse(baseUrl));
        // "https://apis.data.go.kr/B553766/smt-path/path?serviceKey=4fskVJh2CpFFANbJ0JCuuX0%2F90cRzEKtJAdFvkgjcZyq%2F6bd%2BWlBvJD8IZuwtFaTGK7ku4VvkcyJx05A9rK7cg%3D%3D&pageNo=1&numOfRows=10&dept_station_code=${st_num}&dest_station_code=${ar_num}&week=DAY&search_type=FASTEST&dept_time=120001"));
    // "https://apis.data.go.kr/B553766/smt-path/path?serviceKey=4fskVJh2CpFFANbJ0JCuuX0%2F90cRzEKtJAdFvkgjcZyq%2F6bd%2BWlBvJD8IZuwtFaTGK7ku4VvkcyJx05A9rK7cg%3D%3D&pageNo=1&numOfRows=10&dept_station_code=2728&dest_station_code=0214&week=DAY&search_type=FASTEST&dept_time=120001"
    //  &pageNo=1&numOfRows=10&dept_station_code=2728&dest_station_code=0214&week=DAY&search_type=FASTEST&dept_time=120001

    // 정상적으로 데이터를 불러왔다면
    if (response.statusCode == 200) {

    // 데이터 가져오기
    // var body = convert.utf8.decode(response.bodyBytes);
    final body = convert.utf8.decode(response.bodyBytes);

    // var content = jsonDecode(utf8.decode(response.bodyBytes));
    // print("1__________________________________1");
    // print(content['data']['route']);
    // print("2__________________________________2");

    // 필요한 데이터 찾기

    Map<String, dynamic> jsonResult =
    convert.json.decode(body) as Map<String, dynamic>;

    final jsonSub = jsonResult['data']["route"];
    print(jsonSub);


    // Map<String, dynamic> json = jsonDecode(start_st);
    // Sub sub = Sub.fromJson(json);
    // Map<String, dynamic>jsonData = jsonDecode(jsonString);
    
    // Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
    // final jsonSub = json['body'];
    // Sub sub = Sub.fromJson(json);

//     const jsonString =
//         '{"text": "foo", "value": 1, "status": false, "extra": null}';

//     final data = jsonDecode(jsonString);
//     print(data['text']); // foo
//     print(data['value']); // 1
//     print(data['status']); // false
//     print(data['extra']); // null

//     const jsonArray = '''
//   [{"text": "foo", "value": 1, "status": true},
//    {"text": "bar", "value": 2, "status": false}]
// ''';

//     final List<dynamic> dataList = jsonDecode(jsonArray);
//     print(dataList[0]); // {text: foo, value: 1, status: true}
//     print(dataList[1]); // {text: bar, value: 2, status: false}

//     final item = dataList[0];
//     print(item['text']); // foo
//     print(item['value']); // 1
//     print(item['status']); // false

    // 필요한 데이터 그룹이 있다면
    if (jsonSub['start_cd'] != null) {
      // map을 통해 데이터를 전달하기 위해 객체인 List로 만든다.
      List<dynamic> list = jsonSub['start_cd'];

      // map을 통해 Sub형태로 item을  => Sub.fromJson으로 전달
      return list.map<Sub>((start_cd) => Sub.fromJson(start_cd)).toList();

      }

    }
  }
}
