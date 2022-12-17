import 'package:subway_pro/test/post.dart';
import 'package:http/http.dart' as http;

class RemotesService {
  Future<Post?> getPosts() async {
    const apiKey =
        'JF5nfAmlOL3H4QQJbQTcCb3dRxAc0XLw9VaK7s7MdUrtwmhZDdtLQHdB226yd9upVjzPDDq4O6jXfjtf5jrimg%3D%3D';
    var client = http.Client();

    var uri = Uri.parse(
        'http://openapi.seoul.go.kr:8088/69664c66476b647338376b46687842/xml/SearchSTNBySubwayLineInfo/1/5//서울역');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}
