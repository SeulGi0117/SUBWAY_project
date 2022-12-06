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
  final _searchTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchTextEditingController.dispose();
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
                      controller: _searchTextEditingController,
                      decoration: InputDecoration(
                        labelText: '역검색',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        suffixIcon: GestureDetector(
                          child: const Icon(Icons.search, color: Colors.black),
                          //onTap: () => ,
                        ),
                      ),
                      maxLength: 10,
                    ),
                    const SizedBox(height: 25),
                    const SizedBox(height: 70),
                    Image.asset('images/HongDae.png'),
                    const SizedBox(height: 25),
                    Row(
                      //버튼
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        TextButton.icon(
                          onPressed: () {
                            textEditingController.text =
                                _searchTextEditingController.text;
                          },
                          icon: Icon(
                            Icons.subdirectory_arrow_right,
                            size: 40,
                            color: Colors.black,
                          ),
                          label: Text(
                            '출발',
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          ),
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black),
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              Icon(Icons.add),
                              Text('경유',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black))
                            ],
                          ),
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              Icon(Icons.subdirectory_arrow_left),
                              Text('도착',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black))
                            ],
                          ),
                        ),
                      ],
                    ),
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
                          controller: textEditingController,
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
                    const Text(
                      '경유',
                      style: TextStyle(fontSize: 15),
                    ),
                    Padding(
                        // ignore: sort_child_properties_last
                        child: TextField(
                          // controller: ,
                          decoration: InputDecoration(
                              labelText: '경유역',
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
                        // ignore: sort_child_properties_last
                        child: TextField(
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
                              Navigator.pop(context);
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
