

import 'package:flutter/material.dart';

class HYCategoryModel {
	String? id;
	String? title;
	String? color;
	Color cColor = Colors.grey;//颜色给个默认的颜色

	HYCategoryModel({this.id, this.title, this.color});

	HYCategoryModel.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		title = json['title'];
		color = json['color'];
		//1将color转成16进制数字
		final colorInt = int.parse(color!,radix: 16);
		//2将透明度加进去
		cColor = Color(colorInt | 0xFF000000);


	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['id'] = id;
		data['title'] = title;
		data['color'] = color;
		return data;
	}
}