import 'package:my_app/generated/json/base/json_convert_content.dart';
import 'package:my_app/day03-dart中的异步操作/et_teacher_entity.dart';

EtTeacherEntity $EtTeacherEntityFromJson(Map<String, dynamic> json) {
  final EtTeacherEntity etTeacherEntity = EtTeacherEntity();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    etTeacherEntity.name = name;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    etTeacherEntity.age = age;
  }
  final String? adress = jsonConvert.convert<String>(json['adress']);
  if (adress != null) {
    etTeacherEntity.adress = adress;
  }
  return etTeacherEntity;
}

Map<String, dynamic> $EtTeacherEntityToJson(EtTeacherEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['age'] = entity.age;
  data['adress'] = entity.adress;
  return data;
}

extension EtTeacherEntityExtension on EtTeacherEntity {
  EtTeacherEntity copyWith({
    String? name,
    int? age,
    String? adress,
  }) {
    return EtTeacherEntity()
      ..name = name ?? this.name
      ..age = age ?? this.age
      ..adress = adress ?? this.adress;
  }
}