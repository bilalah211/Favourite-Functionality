import 'package:flutter/material.dart';
import 'package:multi_provider_demo/favourite_list.dart';
import 'package:multi_provider_demo/favourite_provider.dart';
import 'package:provider/provider.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Screen'),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavouriteList()));
              },
              child: Icon(Icons.favorite))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 1000,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteProvider>(
                      builder: (context, value, child) {
                        return ListTile(
                          onTap: () {
                            if (value.selectedItem.contains(index)) {
                              value.removeItem(index);
                            } else {
                              value.addItem(index);
                            }
                          },
                          title: Text('Item' + index.toString()),
                          trailing: value.selectedItem.contains(index)
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_outline),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
