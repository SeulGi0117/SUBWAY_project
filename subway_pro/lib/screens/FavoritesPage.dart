// Favorites.dart
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:subway_pro/screens/RoutePage.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final List<String> entries = <String>[
    '강남 -> 홍대',
    '구리 -> 서울역',
    '신촌 -> 인천',
    '안양 -> 반포'
  ];
  final _items = ['강남 -> 홍대', '구리 -> 서울역', '신촌 -> 인천', '안양 -> 반포'];
  var _selected = '강남 -> 홍대';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('경로 즐겨찾기'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: ListTile(
                  leading: Icon(Icons.star),
                  iconColor: Colors.yellow,
                  title: Text(entries[index]),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RoutePage(),
                    ));
                  },
                ));
              },
            ),
          ),
        ],
      ),
    );

    // ListView.builder(
    //   padding: const EdgeInsets.all(50.0),
    //   itemCount: entries.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Container(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Text(entries[index])

    //     );
    //   },
    // )

    //
    //Padding(padding: const EdgeInsets.all(8.0),
    // child: Center(child: Column(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: <Widget>[
    //     DropdownButton(
    //       value: _selected,
    //       items: _items.map(
    //         (value) {
    //           return DropdownMenuItem(
    //             value: value,
    //             child: Text(value)
    //           );
    //         }
    //         ).toList(),
    //         onChanged: (value) {
    //           setState(() {
    //             _selected = value!;
    //           });
    //         },
    //     )
    //           ],
    // )
    // )
    // )
  }
}
