import 'package:flutter/material.dart';
import 'package:my_app/14_screenfit/extension/int_extension.dart';

class HYOperationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;
  final Color textColor;
  HYOperationItem(this._icon,this._title,{this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 90.px,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _icon,
          SizedBox(width: 3.px,),
          Text(_title,style: TextStyle(color: textColor,),)
        ],
      ),
    );
  }
}
