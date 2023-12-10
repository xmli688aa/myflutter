import 'package:flutter/material.dart';
import 'package:my_app/Favorcate/core/model/meal_model.dart';
import 'package:my_app/14_screenfit/extension/int_extension.dart';

class HYDetailContent extends StatelessWidget {
  final HYMealModel _mealModel;

  HYDetailContent(this._mealModel);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBannerImage(),
          buildMakeTitle("制作材料"),
          buildMakeMateria(context),
          buildMakeTitle("制作步骤"),
          buildMakeSteps(context),
        ],
      ),
    );
  }

  //1.横幅图片
  Widget buildBannerImage() {
    return Container(
      width: double.infinity,
        child: Image.network(_mealModel.imageUrl)
    );
  }

//  2.制作材料
  Widget buildMakeMateria(BuildContext context) {
    return buildMakeContent(
        context: context,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _mealModel.ingredients.length,
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 3,
                color: Colors.amber,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(_mealModel.ingredients[index]),
                ),
              );
            }));
  }

//  2.制作步骤
  Widget buildMakeSteps(BuildContext context) {
    return buildMakeContent(
        context: context,
        child: ListView.separated(
          //解决最后一个cell有空余高度的问题
          padding: EdgeInsets.zero,
          //解决子Widget高度不确定导致的bug 'hasSize'
          //ListView高度与内容高度一致
          shrinkWrap: true,
          //解决子视图可以滚动的问题
          physics: NeverScrollableScrollPhysics(),
          itemCount: _mealModel.steps.length,
          itemBuilder: (ctx,index){
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.pink,
                child: Text("#${index+1}"),
              ),
              title: Text(_mealModel.steps[index]),
            );
        },
          separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        ));
  }

//  公共方法
  Widget buildMakeTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.px),
      child: Text(
        title,
        style: TextStyle(fontSize: 24.px, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildMakeContent(
      {required BuildContext context, required Widget child}) {
    return Container(
      //媒体查询
      width: MediaQuery.of(context).size.width - 30.px,
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
        color: Colors.white,
        //设置边框
        border: Border.all(color: Colors.grey),
        //  设置圆角
        borderRadius: BorderRadius.circular(8.px),
      ),
      child: child,
    );
  }
}
