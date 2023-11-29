import 'package:my_app/generated/json/base/json_convert_content.dart';
import 'package:my_app/day03-dart中的异步操作/et_persion.dart';
import 'package:json_annotation/json_annotation.dart';


ETPersion $ETPersionFromJson(Map<String, dynamic> json) {
  final ETPersion eTPersion = ETPersion();
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    eTPersion.nickname = nickname;
  }
  final String? roomName = jsonConvert.convert<String>(json['roomName']);
  if (roomName != null) {
    eTPersion.roomName = roomName;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['imageUrl']);
  if (imageUrl != null) {
    eTPersion.imageUrl = imageUrl;
  }
  return eTPersion;
}

Map<String, dynamic> $ETPersionToJson(ETPersion entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['nickname'] = entity.nickname;
  data['roomName'] = entity.roomName;
  data['imageUrl'] = entity.imageUrl;
  return data;
}

extension ETPersionExtension on ETPersion {
  ETPersion copyWith({
    String? nickname,
    String? roomName,
    String? imageUrl,
  }) {
    return ETPersion()
      ..nickname = nickname ?? this.nickname
      ..roomName = roomName ?? this.roomName
      ..imageUrl = imageUrl ?? this.imageUrl;
  }
}