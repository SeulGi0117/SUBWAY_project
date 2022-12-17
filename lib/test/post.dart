// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

// ignore_for_file: constant_identifier_names, unnecessary_null_comparison

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  late String stationNmEng;

  Post({
    required this.description,
    required this.data,
  });

  Description description;
  List<Datum> data;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        description: Description.fromJson(json["DESCRIPTION"]),
        data: List<Datum>.from(json["DATA"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "DESCRIPTION": description.toJson(),
        "DATA": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.lineNum,
    required this.stationCd,
    required this.stationNmEng,
    required this.stationNm,
    required this.frCode,
  });

  LineNum? lineNum;
  String stationCd;
  String stationNmEng;
  String stationNm;
  String frCode;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        lineNum: lineNumValues.map[json["line_num"]],
        stationCd: json["station_cd"],
        stationNmEng: json["station_nm_eng"],
        stationNm: json["station_nm"],
        frCode: json["fr_code"],
      );

  Map<String, dynamic> toJson() => {
        "line_num": lineNumValues.reverse[lineNum],
        "station_cd": stationCd,
        "station_nm_eng": stationNmEng,
        "station_nm": stationNm,
        "fr_code": frCode,
      };
}

enum LineNum {
  THE_02,
  THE_03,
  EMPTY,
  THE_01,
  LINE_NUM,
  THE_04,
  PURPLE,
  FLUFFY,
  THE_05,
  THE_06,
  THE_07,
  THE_08,
  TENTACLED,
  THE_2,
  THE_09,
  STICKY,
  INDIGO,
  INDECENT,
  HILARIOUS,
  AMBITIOUS,
  CUNNING,
  MAGENTA,
  FRISKY
}

final lineNumValues = EnumValues({
  "용인경전철": LineNum.AMBITIOUS,
  "김포도시철도": LineNum.CUNNING,
  "경의선": LineNum.EMPTY,
  "수인분당선": LineNum.FLUFFY,
  "우이신설경전철": LineNum.FRISKY,
  "서해선": LineNum.HILARIOUS,
  "신분당선": LineNum.INDECENT,
  "신림선": LineNum.INDIGO,
  "경강선": LineNum.LINE_NUM,
  "의정부경전철": LineNum.MAGENTA,
  "경춘선": LineNum.PURPLE,
  "공항철도": LineNum.STICKY,
  "인천선": LineNum.TENTACLED,
  "01호선": LineNum.THE_01,
  "02호선": LineNum.THE_02,
  "03호선": LineNum.THE_03,
  "04호선": LineNum.THE_04,
  "05호선": LineNum.THE_05,
  "06호선": LineNum.THE_06,
  "07호선": LineNum.THE_07,
  "08호선": LineNum.THE_08,
  "09호선": LineNum.THE_09,
  "인천2호선": LineNum.THE_2
});

class Description {
  Description({
    required this.stationNm,
    required this.stationCd,
    required this.lineNum,
    required this.frCode,
    required this.stationNmEng,
  });

  String stationNm;
  String stationCd;
  String lineNum;
  String frCode;
  String stationNmEng;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        stationNm: json["STATION_NM"],
        stationCd: json["STATION_CD"],
        lineNum: json["LINE_NUM"],
        frCode: json["FR_CODE"],
        stationNmEng: json["STATION_NM_ENG"],
      );

  Map<String, dynamic> toJson() => {
        "STATION_NM": stationNm,
        "STATION_CD": stationCd,
        "LINE_NUM": lineNum,
        "FR_CODE": frCode,
        "STATION_NM_ENG": stationNmEng,
      };
}

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    // ignore: prefer_conditional_assignment
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
