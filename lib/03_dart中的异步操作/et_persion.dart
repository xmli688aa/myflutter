import 'package:json_annotation/json_annotation.dart';
part 'et_persion.g.dart';


//自定义的类
@JsonSerializable()//表示当前类需要被 json_serializable 处理
class ETPersion {
  String nickname = "";
  String roomName = "";
  String imageUrl = "";
  ETPersion(
      {required this.nickname, required this.roomName, required this.imageUrl});
  factory ETPersion.formJson(Map<String,dynamic> json) =>_$ETPersionFromJson(json);
  Map<String, dynamic> toJson() => _$ETPersionToJson(this);

}

/*/
 *
 *1、新建 et_persion.dart 文件，内容如下：
 * 1）@JsonSerializable() ：表示当前类需要被 json_serializable 处理；
 * 2）part 'et_persion.g.dart'：这里的 part 表示当前文件（et_persion.dart）关联 et_persion.g.dart，其中 et_persion.g.dart 命名规范是：文件名称.g.dart；
 * 3） _$ETPersionFromJson ：是 json_serializable 帮我们生成的将 Map 转为实体类的方法，这个方法的命名规则：_$+当前类名+FromJson；
 * 4）_$ResultToJson ：是 json_serializable 帮我们生成的将实体类转为 Map 的方法，这个方法的命名规则：_$+当前类名+ToJson；
 * 5）factory ETPersion.fromJson : 这里是声明了工厂构造函数 fromJson ；
* 2、去到项目根目录，执行 flutter pub run build_runner build 命令，生成 result.g.dart 文件
 */
