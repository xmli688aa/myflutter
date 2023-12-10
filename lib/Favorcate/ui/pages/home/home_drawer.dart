import 'package:flutter/material.dart';
import 'package:my_app/14_screenfit/extension/int_extension.dart';

class HYHomeDrawer extends StatelessWidget {
  const HYHomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      //外面包裹一层Container 来控制Drawer的宽度
        width: 250.px,
        // color: Colors.white,
        child: Drawer(
          child: Scaffold(
            appBar: AppBar(
              title: Text("开始动手",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              backgroundColor: Colors.amber,
            ),
            body: Column(
              children: [
                SizedBox(height: 10,),
                buildListTitle(Icon(Icons.restaurant ),"进餐",(){
                  Navigator.of(context).pop();
                  print("点击了进餐");
                }),
                buildListTitle(Icon(Icons.settings ),"过滤",(){
                  Navigator.of(context).pop();
                  print("点击了过滤");
                }),

              ],
            ),
          ),
        ))
    ;
  }

  Widget buildListTitle(Widget icon, String title,void Function() handler){
  return ListTile(
    leading: icon,
    title: Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
    onTap: handler,

  );
  
  }
}
