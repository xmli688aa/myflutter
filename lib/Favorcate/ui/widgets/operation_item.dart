import 'package:flutter/material.dart';
import 'package:my_app/day14_screenfit/extension/int_extension.dart';

class HYOperationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;
  HYOperationItem(this._icon,this._title);
  
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: <Widget>[
        _icon,
        SizedBox(width: 3.px,),
        Text(_title)
      ],
    );
  }
}
