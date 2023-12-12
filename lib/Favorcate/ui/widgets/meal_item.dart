import 'package:flutter/material.dart';
import 'package:my_app/Favorcate/core/model/meal_model.dart';
import 'package:my_app/Favorcate/ui/pages/detail/detail.dart';
import 'package:my_app/Favorcate/ui/widgets/operation_item.dart';
import 'package:my_app/14_screenfit/extension/int_extension.dart';
import 'package:provider/provider.dart';

import '../../core/viewmodel/favor_view_model.dart';

final _cardRadius = 12.px;

class HYMealItem extends StatelessWidget {
  HYMealModel _mealModel;

  HYMealItem(this._mealModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      //外边距
      margin: EdgeInsets.all(10.px),
      //阴影
      elevation: 5,
      //card的圆角
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_cardRadius)),
      child: Column(
        children: [
          buildBasicInfo(context),
          buildOperationInfo(),
        ],
      ),
    );
  }

  Widget buildBasicInfo(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HYDetailScreen.routeName, arguments: _mealModel);
      },
      child: Stack(children: [
        ClipRRect(
          //裁剪图片控件
          //裁剪图片 只裁剪左上，右上
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_cardRadius),
              topRight: Radius.circular(_cardRadius)),
          child: Image.network(
            _mealModel.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 250.px,
            errorBuilder: (ctx,error,stick){
              return Image.asset("assets/images/errorImage.png");
            },
          ),
        ),
        Positioned(
            bottom: 10.px,
            right: 10.px,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
              //水平方向加10垂直方向加5
              width: 300.px,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.px),
                color: Colors.black54,
              ),
              child: Text(this._mealModel.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white)),
            ))
      ]),
    );
  }

  Widget buildOperationInfo() {
    return Container(
      padding: EdgeInsets.all(16.px),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HYOperationItem(Icon(Icons.schedule), "${_mealModel.duration}分钟"),
          HYOperationItem(Icon(Icons.restaurant), "${_mealModel.complexStr}"),
          buildFavorItem(),
        ],
      ),
    );
  }
  Widget buildFavorItem(){
    return Consumer<HYFavorViewModel>(builder: (ctx, favorVM, child) {
      //1.判断是否是收藏状态
      final isFavor = favorVM.isFavor(_mealModel);
      final favorColor = isFavor?Colors.red:Colors.black;
      final icon = isFavor
          ? Icon(
        Icons.favorite,
        color: favorColor,
      )
          : Icon(Icons.favorite_border, color: favorColor);

      return GestureDetector(
          onTap: () {
            if (isFavor) {
              favorVM.removeMeal(_mealModel);
            } else {
              favorVM.addMeal(_mealModel);
            }
          },
          child: HYOperationItem(icon, isFavor ? "收藏" : "未收藏",textColor: favorColor,)
      );
    });
  }
}
