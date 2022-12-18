import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_application_1/route_subway_model.dart';
import 'package:subway_pro/test1/route_subway_model.dart';

enum SubwayInfo {
  wangsimni(name: '왕십리', number: 0209),
  gangnam(name: '강남', number: 0222);

  final String name;
  final int number;

  const SubwayInfo({required this.name, required this.number});
}

String? num1 = "";
String num2 = "0151";


const apiKey =
    'fSYsW9vfF6O3YjnQSCOx2EKU3HYtjUM9E8a1%2FYcAjfFnVP9RaCFbllgzXd%2BX%2FwiX6yefRR8qE%2Fi0B3ers9Y4jw%3D%3D';

class SubwayDataSource {
  Future<List<RouteSubwayModel>> getSubway(
      SubwayInfo startInfo, SubwayInfo arrivalInfo) async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://apis.data.go.kr/B553766/smt-path/path?serviceKey=$apiKey&numOfRows=10&pageNo=1&dept_station_code=${num1}&dest_station_code=${num2}&week=DAY&search_type=FASTEST&dept_time=120001'),  // startInfo.number  , arrivalInfo.number
      );

      print('1-----------------------------1');
      var content = jsonDecode(utf8.decode(response.bodyBytes));
      print(content['data']['route']);
      print('2-----------------------------2');
      
      // print(response.body);
      

      

      Iterable iterable = jsonDecode(response.body);  //['data'][0]['route']
      return iterable.map((e) => RouteSubwayModel.fromJson(e)).toList();
    } catch (e) {
      throw (Exception(
        'Failed to load'
      ));
    }
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final num1Contorller = TextEditingController();
  final num2Contorller = TextEditingController();

  late TextEditingController startController;
  late TextEditingController arrivalController;
  late SubwayDataSource subwayDataSource;
  List<RouteSubwayModel> routeSubwayModels = [];
  bool? isLoading;

   @override
  void dispose() {
   num1Contorller.dispose();
   num2Contorller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startController = TextEditingController(text: '왕십리');
    arrivalController = TextEditingController(text: '강남');
    subwayDataSource = SubwayDataSource();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: startController),
            const SizedBox(
              height: 20.0,
            ),
            TextField(controller: arrivalController),
            const SizedBox(
              height: 20.0,
            ),
            
            // 출발역 코드 받기
            TextField(controller: num1Contorller,
            onChanged: (text) {
              num1 = text;
            },
            ),const SizedBox(
              height: 20.0,
            ),

            IconButton(onPressed: () {
              num1 = num1Contorller.value.toString();
            }, icon: Icon(Icons.check)),


            TextButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                },);

                try {
                  List<SubwayInfo> values = SubwayInfo.values;
                  SubwayInfo startInfo =
                      values.firstWhere((e) => e.name == startController.text);
                  SubwayInfo arrivalInfo = values
                      .firstWhere((e) => e.name == arrivalController.text);
                  subwayDataSource
                      .getSubway(startInfo, arrivalInfo)
                      .then((value) {
                    setState(() {
                      routeSubwayModels = value;
                    });
                  });

                  setState(() {
                    isLoading = false;
                  });
                } catch (e) {
                  setState(() {
                    isLoading = null;
                  });
                }
              },
              child: const Text('검색하기'),
            ),
            const SizedBox(height: 30.0),
            if (isLoading != null) buildInfo(),
          ],
        ),
      ),
    );
  }

  Widget buildInfo() {
    if (routeSubwayModels.isEmpty) {
      return const SizedBox();
    }

    if (isLoading == true) {
      return const Center(child: CircularProgressIndicator());
    }

    return Expanded(
      child: ListView.separated(
        itemCount: routeSubwayModels.length,
        itemBuilder: (context, index) {
          return SubwayInfoChip(
            model: routeSubwayModels[index],
          );
        },
        separatorBuilder: (_, __) {
          return const Divider(height: 25);
        },
      ),
    );
  }
}

class SubwayInfoChip extends StatelessWidget {
  const SubwayInfoChip({Key? key, required this.model}) : super(key: key);
  final RouteSubwayModel model;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('${model.lineNum}호선'),
      const SizedBox(height: 10.0),
      Text('${model.stationNm}역'),
    ]);
  }
}
