// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:subway_pro/main.dart';
import 'package:subway_pro/screens/RoutePage.dart';
import 'HomePage.dart';

class StationserchPage extends StatefulWidget {
  const StationserchPage({super.key});

  @override
  State<StationserchPage> createState() => _StationserchPageState();
}

class _StationserchPageState extends State<StationserchPage> {
  late TextEditingController textEditingController;

  TextEditingController inputController = TextEditingController();
  String inputText = '';

  TextEditingController inputController2 = TextEditingController();
  String inputText2 = '';

  TextEditingController inputController4 = TextEditingController();
  String inputText4 = '';

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
    textEditingController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('역검색'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 100.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        const Icon(
                          Icons.subway,
                          size: 60,
                        ),
                        Expanded(
                          child: const Text(
                            '지하철 노선도',
                            style: TextStyle(fontSize: 50),
                          ),
                        ),
                      ],
                    ),

                    TextField(
                      controller: inputController,
                      decoration: InputDecoration(
                        labelText: '역검색',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        prefixIcon: GestureDetector(
                          child: const Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 20,
                          ),
                          //onTap: () => ,
                        ),
                        suffixIcon: GestureDetector(
                          child: const Icon(
                            Icons.cancel,
                            color: Colors.black,
                            size: 20,
                          ),
                          onTap: () => textEditingController.clear(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),

                    //~~ 호선, 역 이름 부분
                    // ignore: unnecessary_new
                    new Stack(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            height: 70,
                            width: 515,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60.0),
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.green,
                                  style: BorderStyle.solid,
                                  width: 10),
                            ),
                            child: TextField(
                              controller: inputController,
                              decoration: InputDecoration(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  height: 2,
                                  fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          left: 30,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70.0),
                              color: Colors.green,
                            ),
                            child: const Text(
                              '호선',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                height: 2.3,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    //아래는 < 이전역, 다음역> 부분
                    //
                    // ignore: unnecessary_new
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        new Stack(
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            Positioned(
                              child: Container(
                                height: 190,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 7),
                                ),
                                child: const Text(
                                  '이전 역 이름',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      height: 2.1,
                                      fontSize: 35),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 65,
                              bottom: 165,
                              child: Container(
                                height: 45,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60.0),
                                  color: Colors.grey,
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 6),
                                ),
                                child: const Text(
                                  '이전역',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 2,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        new Stack(
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            Positioned(
                              child: Container(
                                height: 190,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 7),
                                ),
                                child: const Text(
                                  '다음 역 이름',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      height: 2.1,
                                      fontSize: 35),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 65,
                              bottom: 165,
                              child: Container(
                                height: 45,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60.0),
                                  color: Colors.lightGreenAccent.shade400,
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 6),
                                ),
                                child: const Text(
                                  '다음 역',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 1.8,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    const SizedBox(
                      height: 100.0,
                    ),

                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[]),
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
                          controller: inputController2,
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                              labelText: '출발역',
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

                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      '도착',
                      style: TextStyle(fontSize: 15),
                    ),
                    Padding(
                        // ignore: sort_child_properties_last
                        child: TextField(
                          controller: inputController4,
                          decoration: InputDecoration(
                              labelText: '도착역',
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
                    // ignore: unnecessary_new
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          TextButton.icon(
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
                            label: Text('메인 홈페이지',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black)),
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                                // ignore: deprecated_member_use
                                primary: Colors.white,
                                minimumSize: Size(200, 50),
                                // ignore: deprecated_member_use
                                onSurface: Colors.white),
                          ),
                          TextButton.icon(
                            //버튼
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => RoutePage(
                                          startStation: inputController2.text,
                                          endStation: inputController4.text,
                                          middleStation: '',
                                        )),
                              );
                            },
                            icon: const Icon(
                              Icons.search,
                              size: 40,
                              color: Colors.black,
                            ),

                            // ignore: prefer_const_constructors
                            label: Text('경로 찾기',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black)),
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                                // ignore: deprecated_member_use
                                primary: Colors.white,
                                minimumSize: Size(200, 50),
                                // ignore: deprecated_member_use
                                onSurface: Colors.white),
                          ),
                        ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
