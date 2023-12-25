
import 'dart:async';

import 'package:flutter/material.dart';

class ETCustomDialog extends Dialog {
  String title;
  String content;
  ETCustomDialog(this.title,this.content);

  _showTimer(context){
    var timer ;
    timer = Timer.periodic(Duration(seconds: 2), (t) {
      Navigator.pop(context);
      t.cancel();//取消定时器 也可以用timer.cancel
    });
  }
  @override
  Widget build(BuildContext context) {
    _showTimer(context);
    // TODO: implement build
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.white,
          child:  Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(title),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: Icon(Icons.close),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(content,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
