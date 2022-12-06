import 'package:flutter/rendering.dart';
import 'Favorite_page_model.dart';
import 'package:subway_pro/Favorite_screens/Favorite_list.dart';
import 'package:subway_pro/Favorite_screens/Favorite_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteListModel {
  static List<String> itmeNames = [
    '홍대입구',
    '여의도',
    '서울역',
    '용산역',
    '서울대입구',
    '뚝섬',
  ];

  static List<String> itemSubtitle = [
    '홍대입구 최단경로',
    '여의도 최단경로',
    '서울역 최단경로',
    '용산역 최단경로',
    '서울대입구 최단경로',
    '뚝섬 최단경로',
  ];

  Item getById(int id) => Item(
        id,
        itmeNames[id % itmeNames.length],
        itemSubtitle[id % itemSubtitle.length],
      );

  Item getByPosition(int position) {
    return getById(position);
  }
}

class Item {
  final int id;
  final String name;
  final String subtitle;

  const Item(
    this.id,
    this.name,
    this.subtitle,
  );

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
