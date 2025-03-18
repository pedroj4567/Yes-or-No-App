// import 'dart:convert';

// YesNoModel yesNoModelFromJson(String str) =>
// YesNoModel.fromJson(json.decode(str));

// String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson()); // pasa de json a objeto

import 'package:yes_or_no_app/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonToMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  // este mapa deberia estar en un archivo independiente
  Message toMessageEntity() => Message(
        text: answer == 'yes' ? 'Si' : 'No',
        fromWho: FromWho.her,
        imageUrl: image,
      );
}
