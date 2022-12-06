// Homepage.dart
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:subway_pro/screens/FavoritesPage.dart';
import 'package:subway_pro/screens/StationsearchPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _items = ['강남 -> 홍대', '구리 -> 서울역', '신촌 -> 인천', '안양 -> 반포'];
  var _selected = '강남 -> 홍대';

  @override
  Widget build(BuildContext context) {
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
                        const Icon(
                          Icons.star,
                          size: 30,
                          color: Colors.yellow,
                        ),
                        const Text(
                          '경로 즐겨찾기',
                          style: TextStyle(fontSize: 20),
                        ),
                        DropdownButton(
                          value: _selected,
                          items: _items.map((value) {
                            return DropdownMenuItem(
                                value: value, child: Text(value));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selected = value!;
                            });
                          },
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
