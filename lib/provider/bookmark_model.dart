import 'package:flutter/cupertino.dart';
import 'package:subway_pro/models/items_model.dart';

class BookmarkBloc extends ChangeNotifier {
  int _count = 0;
  List<ItemModel> items = [];

  void addCount() {
    _count++;
    notifyListeners();
  }

  void addItems(ItemModel data) {
    items.add(data);
    notifyListeners();
  }

  int get count {
    return _count;
  }

  List<ItemModel> get itemsList {
    return items;
  }
}
