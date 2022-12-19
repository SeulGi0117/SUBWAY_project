//Route.dart
// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'HomePage.dart';

class RoutePage extends StatefulWidget {
  final String startStation;
  final String endStation;
  const RoutePage(
      {super.key, required this.startStation, required this.endStation});

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  @override
  Widget build(BuildContext context) {
    print(widget.startStation);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('경로'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20.0, top: 20.0),
          //padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 200.0),
                Expanded(
                  flex: 1,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        const SizedBox(height: 100.0),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                const Icon(
                                  Icons.subway,
                                  size: 60,
                                ),
                                const Text(
                                  '지하철 노선도',
                                  style: TextStyle(fontSize: 50),
                                ),
                              ]),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: <Widget>[
                              // ignore: prefer_const_constructors
                              Text(
                                '최단 경로',
                                style: TextStyle(fontSize: 30),
                              ),
                              const SizedBox(width: 50.0),
                              Text(
                                '소요 시간 : 13분',
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                            height: 2,
                            width: 600,
                            child: Container(color: Colors.black54)),
                        const SizedBox(height: 70),
                        Image.asset('images/Route.png'),
                        const SizedBox(height: 25),
                      ]),
                ),
                Center(
                  child: SizedBox(
                    height: 300,
                    width: 200,
                    child: Container(color: Colors.white),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Expanded(
                    flex: 1,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          const SizedBox(
                            height: 100.0,
                          ),
                          SizedBox(
                              height: 600,
                              width: 2,
                              child: Container(color: Colors.black54)),
                        ]),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        const SizedBox(
                          height: 100.0,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                TextButton.icon(
                                  // 즐겨찾기 추가 버튼
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.star_border,
                                    color: Colors.yellow,
                                    size: 50,
                                  ),
                                  label: const Text(
                                    '경로 즐겨찾기 등록',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.black),
                                ),
                              ]),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          '출발',
                          style: TextStyle(fontSize: 15),
                        ),
                        Padding(
                            // ignore: sort_child_properties_last
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: widget.startStation,
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
                            padding: EdgeInsets.all(20.0)),
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          '도착',
                          style: TextStyle(fontSize: 15),
                        ),
                        Padding(
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: widget.endStation,
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
                            padding: EdgeInsets.all(20.0)),
                        TextButton.icon(
                          //버튼
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Homepage()),
                            );
                          },
                          icon: const Icon(
                            Icons.add_box,
                            size: 40,
                            color: Colors.black,
                          ),

                          // ignore: prefer_const_constructors
                          label: Text('노선도 보기',
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
                      ]),
                ),
                const SizedBox(
                  width: 200.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
