import 'package:flutter/material.dart';

import 'eventbus_page.dart';
import 'global_manager.dart';

class EventBusPage2 extends StatelessWidget {
  const EventBusPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("eventbus传递数据给上个页面"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          // eventBus.fire("这是第二个页面修改的数据");
          PersonInfo info = PersonInfo("于云鹏", 49);
          EventBusManager.instance.fire(info);

        }, child: Text("修改上个页面的数据")),
      ),
    );
  }
}

