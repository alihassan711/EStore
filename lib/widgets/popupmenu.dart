import 'package:flutter/material.dart';
class PopUpMenuCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: Offset(0, 45), // SET THE (X,Y) POSITION
      iconSize: 30,
      icon: Icon(
        Icons.menu, // CHOOSE YOUR CUSTOM ICON
        color: Colors.white,
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            enabled: false, // DISABLED THIS ITEM
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                PopupMenuItem(
                  child: ListTile(title: Text('Preview'),
                  leading: Icon(Icons.preview),
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(title: Text('Share'),
                    leading: Icon(Icons.share),
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(title: Text('Get Link'),
                    leading: Icon(Icons.link),
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(title: Text('Remove'),
                    leading: Icon(Icons.delete),
                  ),
                ),
                // WRITE YOUR CODE HERE
              ],
            ),
          ),
        ];
      },
    );
  }
  }

