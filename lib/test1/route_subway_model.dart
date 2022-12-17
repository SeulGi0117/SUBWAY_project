class RouteSubwayModel {
  RouteSubwayModel({
    required this.stationNm,
    required this.lineNum,
  });
  late final String stationNm;
  late final String lineNum;

  RouteSubwayModel.fromJson(Map<String, dynamic> json) {
    stationNm = json['station_nm'];
    lineNum = json['line_num'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['station_nm'] = stationNm;
    _data['line_num'] = lineNum;
    return _data;
  }
}
