import 'package:smart_inventory/databasedetails.dart';
import 'package:smart_inventory/itemdetail.dart';
import 'package:smart_inventory/main.dart';
import 'package:flutter/material.dart';

Future<void> displayDeleteDialog(BuildContext context, String name) async {
  //this brings up an alert dialog to input material

  //deleteName = deleteName;

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Are you sure you would like to remove the item?'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              deleteItem(context, name);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      InventoryScreen(), //navigates to the material screen, it really should just reload ui but this is a bandaid
                ),
              );
            },
          ),
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

class InventoryScreen extends StatelessWidget {
  InventoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyApp(),
            ),
          ),
        ),
        title: Text("InventoryScreen"),
      ),
      body: ListView(
        children: [
          for (int index = 0; index < mapI.length; index++)
            ElevatedButton(
              child: Text(mapI[index]['name']),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetail(
                      i: index,
                    ),
                  ),
                );
              },
              onLongPress: () {
                displayDeleteDialog(context, mapI[index]['name']);
              },
            ),
        ],
      ),
    );
  }
}