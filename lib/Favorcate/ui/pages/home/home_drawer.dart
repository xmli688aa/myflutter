import 'package:flutter/material.dart';
import 'package:my_app/14_screenfit/extension/int_extension.dart';
import 'package:my_app/Favorcate/ui/pages/filter/filter.dart';

class HYHomeDrawer extends StatelessWidget {
  const HYHomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      //外面包裹一层Container 来控制Drawer的宽度
        width: 250.px,
        // color: Colors.white,
        child: Drawer(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("开始动手",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              backgroundColor: Colors.amber,
            ),
            body: Column(
              children: [
                const SizedBox(height: 10,),
                buildListTitle(const Icon(Icons.restaurant ),"进餐",(){
                  Navigator.of(context).pop();
                  print("点击了进餐");
                }),
                buildListTitle(const Icon(Icons.settings ),"过滤",(){
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(HYFilterScreen.routeName);
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
    title: Text(title,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
    onTap: handler,

  );
  
  }
}
