import 'package:flutter/foundation.dart';
import 'Favorite_list_model.dart';

class FavoritePageModel extends ChangeNotifier {
  late FavoritePageModel _favoritelist;

  final List<int> _itemIds = [];

  FavoritePageModel get favoritelist => _favoritelist;

  set favoriteslist(FavoriteListModel newList) {
    _favoritelist = newList as FavoritePageModel;
    notifyListeners();
  }

  List get items => _itemIds.map((id) => _favoritelist.getById(id)).toList();

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}
