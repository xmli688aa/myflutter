import 'package:flutter/material.dart';

class ETDetailPage extends StatelessWidget {
  static const String routeName = "/ETDetailPage";
  String message;
  ETDetailPage( this.message) ;
  @override
  Widget build(BuildContext context) {
    // String message2 = ModalRoute.of(context)?.settings.arguments as String;

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop)  {
        if (didPop) return;
        // backLastPage(context);
        Navigator.of(context).pop("详情页传递过来的数据");
      },

      child: Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: (){
          //     Navigator.of(context).pop("a detail message");
          //
          //   },
          // ),
          title: Text("详情页"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${message}"),
              ElevatedButton(onPressed: () {
                backLastPage(context);
              }, child: Text("返回上个页面")),

            ],
          ),
        ),
      ),
    );
  }


  void backLastPage(BuildContext context){
    Navigator.of(context).pop("a detail message");
  }
}
