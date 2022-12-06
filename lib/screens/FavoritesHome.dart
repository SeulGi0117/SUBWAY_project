// Favorites.dart
import 'package:flutter/material.dart';
import 'package:subway_pro/Favorite_screens/Favorite_list.dart';
import 'package:subway_pro/Favorite_screens/Favorite_page.dart';
import 'package:subway_pro/models/Favorite_page_model.dart';
import 'package:subway_pro/models/Favorite_list_model.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => FavoriteListModel()),
        ChangeNotifierProxyProvider<FavoriteListModel, FavoritePageModel>(
          create: (context) => FavoritePageModel(),
          update: (context, favoritelist, favoritepage) {
            if (favoritepage == null)
              throw ArgumentError.notNull('favoritepage');
            favoritepage.favoriteslist = favoritelist;
            return favoritepage;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Favoirite Provider',
        initialRoute: '/',
        routes: {
          '/': (context) => FavoriteList(),
          'favoritepage': (context) => FavoritePage(),
        },
      ),
    );
  }
}
