// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Bookmarks_page.dart';
import 'package:subway_pro/models/items_model.dart';

import 'provider/bookmark_model.dart';

class Bookmarks_HomePage extends StatefulWidget {
  @override
  _Bookmarks_HomePageState createState() => _Bookmarks_HomePageState();
}

class _Bookmarks_HomePageState extends State<Bookmarks_HomePage> {
  List itemsList = [
    {
      'title': 'item 1',
      'subtitle': 'this is item 1',
      'status': 'false',
    },
    {
      'title': 'item 2',
      'subtitle': 'this is item 2',
      'status': 'false',
    },
    {
      'title': 'item 3',
      'subtitle': 'this is item 3',
      'status': 'false',
    },
    {
      'title': 'item 4',
      'subtitle': 'this is item 4',
      'status': 'false',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var bookmarkBloc = Provider.of<BookmarkBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Bookmark Flutter"),
        actions: [
          Row(
            children: [
              Text(bookmarkBloc.count.toString()),
              IconButton(
                icon: Icon(Icons.star),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookmarksPage(),
                      ));
                },
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: itemsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    bookmarkBloc.addCount();
                    // print(bookmarkBloc.count);

                    ItemModel itemModel = new ItemModel(
                      title: itemsList[index]['title'],
                      subTitle: itemsList[index]['subtitle'],
                    );

                    bookmarkBloc.addItems(itemModel);

                    print(bookmarkBloc.items[index].title);
                    print(bookmarkBloc.items.length);

                    setState(() {
                      itemsList[index]['status'] = "true";
                    });
                  },
                  title: Text(itemsList[index]['title']),
                  subtitle: Text(itemsList[index]['subtitle']),
                  trailing: itemsList[index]['status'] == "false"
                      ? Icon(Icons.star_border)
                      : Icon(
                          Icons.star,
                          color: Colors.blue,
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
