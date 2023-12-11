import 'package:flutter/material.dart';
import 'package:my_app/14_screenfit/extension/int_extension.dart';
import 'package:my_app/Favorcate/core/viewmodel/filter_view_model.dart';
import 'package:provider/provider.dart';

class HYFilterContent extends StatefulWidget {
  const HYFilterContent({Key? key}) : super(key: key);

  @override
  State<HYFilterContent> createState() => _HYFilterContentState();
}

class _HYFilterContentState extends State<HYFilterContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildYourChoice(),
        buildChoicesSelect(),
      ],
    );
  }

  Widget buildYourChoice() {
    return Container(
      padding: EdgeInsets.all(20.px),
      alignment: Alignment.center,
      width: double.infinity,
      // height: 60.px,
      child: Text(
        "展示你的选择",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.px),
      ),
    );
  }

  Widget buildChoicesSelect() {
    return Expanded(child: Consumer<HYFilterViewModel>(
      // child: null,
      builder: (ctx, filterVM, child) {
        return ListView(
          // shrinkWrap: true,
          children: [
            buildListTitle("无谷蛋白", "展示无谷蛋白实物", filterVM.isGlutenFree, (value) {
              filterVM.isGlutenFree = value;
            }),
            buildListTitle("不含有乳糖", "展示不含乳糖实物", filterVM.isLactoseFree,
                (value) {
              filterVM.isLactoseFree = value;
            }),
            buildListTitle("普通素食者", "展示普通素食者实物", filterVM.isVegetarian,
                (value) {
              filterVM.isVegetarian = value;
            }),
            buildListTitle("严格素食者", "展示严格素食者实物", filterVM.isVegan, (value) {
              filterVM.isVegan = !filterVM.isVegan;
            }),
          ],
        );
      },
    ));
  }

  Widget buildListTitle(
    String title,
    String subTitle,
    bool select,
    onChange,
  ) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: Switch(
        value: select,
        onChanged: onChange,
      ),
    );
  }
}
