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
    required this.start_st,
    required this.end_st,
    required this.dept_time,
    required this.arrv_time,
    required this.time,
    required this.week,
    required this.transfer,
    required this.fee,
    required this.station_nm,
    required this.line_num,
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



    // // 충전 방식
    // if (json["cpTp"] == "1") {
    //   json["cpTp"] = "충전 방식 : B타입(5핀)";
    // } else if (json["cpTp"] == "2") {
    //   json["cpTp"] = "충전 방식 : C타입(5핀)";
    // } else if (json["cpTp"] == "3") {
    //   json["cpTp"] = "충전 방식 : BC타입(5핀)";
    // } else if (json["cpTp"] == "4") {
    //   json["cpTp"] = "충전 방식 : BC타입(5핀)";
    // } else if (json["cpTp"] == "5") {
    //   json["cpTp"] = "충전 방식 : DC차데모";
    // } else if (json["cpTp"] == "6") {
    //   json["cpTp"] = "충전 방식 : AC3상";
    // } else if (json["cpTp"] == "7") {
    //   json["cpTp"] = "충전 방식 : DC콤보";
    // } else if (json["cpTp"] == "8") {
    //   json["cpTp"] = "충전 방식 : DC차데모+DC콤보";
    // } else if (json["cpTp"] == "9") {
    //   json["cpTp"] = "충전 방식 : DC차데모+AC3상";
    // } else if (json["cpTp"] == "10") {
    //   json["cpTp"] = "충전 방식 : DC차데모+DC콤보+AC3상";
    // }

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