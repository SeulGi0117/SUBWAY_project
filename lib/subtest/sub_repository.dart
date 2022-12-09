import 'dart:convert' as convert;
import 'package:subway_pro/subtest/sub.dart';
import 'package:http/http.dart' as http;

class SubRepoitory {
  // api key
   var apiKey =
      "4fskVJh2CpFFANbJ0JCuuX0%2F90cRzEKtJAdFvkgjcZyq%2F6bd%2BWlBvJD8IZuwtFaTGK7ku4VvkcyJx05A9rK7cg%3D%3D";

  Future<List<Sub>?> loadSubs() async {
    
    var start_st = "어린이대공원";
    String baseUrl =
        "https://apis.data.go.kr/B553766/smt-path/path?serviceKey=$apiKey";
    final response = await http.get(Uri.parse(baseUrl));
    
    // 정상적으로 데이터를 불러왔다면
    if (response.statusCode == 200) {

      // 데이터 가져오기
      final body = convert.utf8.decode(response.bodyBytes);

      // 필요한 데이터 찾기
      Map<String, dynamic> jsonResult = convert.json.decode as Map<String, dynamic>;
      final jsonSub = jsonResult['response']['body']['items'];

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