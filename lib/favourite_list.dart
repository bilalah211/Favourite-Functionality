import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favourite_provider.dart';

class FavouriteList extends StatefulWidget {
  const FavouriteList({Key? key}) : super(key: key);

  @override
  State<FavouriteList> createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: provider.selectedItem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteProvider>(builder: (context,value,child){
                    return ListTile(
                      onTap: () {
                        if(value.selectedItem.contains(index)){
                          value.removeItem(index);
                        }else{
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
