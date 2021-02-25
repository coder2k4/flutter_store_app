import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  const UserProductItem({Key key, this.imageUrl, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.edit), onPressed: null),
            IconButton(icon: Icon(Icons.delete), onPressed: null),
          ],
        ),
      ),
    );
  }
}
