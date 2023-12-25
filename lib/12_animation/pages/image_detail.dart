import 'package:flutter/material.dart';

class HYImageDetailPage extends StatelessWidget {
  final String _imageURL;
  final int _index;
  const HYImageDetailPage(this._imageURL,this._index, {super.key});

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
