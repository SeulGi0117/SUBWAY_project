import 'package:flutter/cupertino.dart';

import 'package:subway_pro/models/Favorite_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Page'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: _FavoritePageList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// UI of FavoritePage list //

class _FavoritePageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favoritepage = context.watch<FavoritePageModel>();
    return ListView.builder(
      itemCount: favoritepage.items.length,
      itemBuilder: (context, index) => ListTile(
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            favoritepage.remove(favoritepage.items[index]);
          },
        ),
        title: Text(
          favoritepage.items[index].name,
        ),
        subtitle: Text(
          favoritepage.items[index].subtitle,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    );
  }
}
