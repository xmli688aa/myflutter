import 'package:flutter/material.dart';

class HYImageDetailPage extends StatelessWidget {
  final String _imageURL;
  final int _index;
  HYImageDetailPage(this._imageURL,this._index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Hero(tag: _index, child: Image.network(_imageURL))
        ),
      ),
    );
  }
}
