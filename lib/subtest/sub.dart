import 'package:flutter/foundation.dart';

class Sub {
  String? start_st ; // 출발역
  String? end_st; // 도착역
  String? dept_time; // 출발시간
  String? arrv_time; // 도착시간
  String? time; // 소요시간
  String? week; // 요일
  String? transfer; // 환승횟수
  String? fee; // 운임정보 (요금)
  String? station_nm; // 경로 역사명
  String? line_num; // 호선 번호

  Sub({
    this.start_st,
    this.end_st,
    this.dept_time,
    this.arrv_time,
    this.time,
    this.week,
    this.transfer,
    this.fee,
    this.station_nm,
    this.line_num,
  });

  factory Sub.fromJson(Map<String, dynamic> json) {
    //  요일 : 주중 토요일 공휴일
    if (json["week"] == "DAY") {
      json["week"] = "요일 : 주중";
    } else if (json["week"] == "SAT") {
      json["week"] = "요일 : 토요일";
    } else if (json["week"] == "HOL") {
      json["week"] = "요일 : 공휴일";
    }

    return Sub(
      start_st: json["start_st"] as String,
      end_st: json["end_st"] as String,
      dept_time: json["dept_time"] as String,
      arrv_time: json["arrv_time"] as String,
      time: json["cpTp"] as String,
      week: json["csNm"] as String,
      transfer: json["transfet"] as String,
      fee: json["fee"] as String,
      station_nm: json["station_nm"] as String,
      line_num: json["line_num"] as String,
    );
  }
}