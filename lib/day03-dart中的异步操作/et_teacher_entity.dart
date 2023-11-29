import 'package:my_app/generated/json/base/json_field.dart';
import 'package:my_app/generated/json/et_teacher_entity.g.dart';
import 'dart:convert';
export 'package:my_app/generated/json/et_teacher_entity.g.dart';

@JsonSerializable()
class EtTeacherEntity {
	String? name;
	int? age;
	String? adress;

	EtTeacherEntity();

	factory EtTeacherEntity.fromJson(Map<String, dynamic> json) => $EtTeacherEntityFromJson(json);

	Map<String, dynamic> toJson() => $EtTeacherEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}