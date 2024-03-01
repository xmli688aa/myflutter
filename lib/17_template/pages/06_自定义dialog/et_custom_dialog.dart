
import 'dart:async';

import 'package:flutter/material.dart';

class ETCustomDialog extends Dialog {
  String title;
  String content;
  ETCustomDialog(this.title,this.content, {super.key});
  var _timer ;
  bool _isPop = false;
  _showTimer(BuildContext context){
    _timer = Timer.periodic(const Duration(seconds: 2), (t) {
        print("timer执行完毕");
        if(_isPop == false){
          Navigator.pop(context);
        }
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
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(title),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: const Icon(Icons.close),
                        onTap: (){
                          _isPop = true;
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
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
