import 'package:flutter/material.dart';
import 'package:my_app/14_screenfit/extension/int_extension.dart';

class HYOperationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;
  final Color textColor;
  const HYOperationItem(this._icon,this._title,{super.key, this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
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
