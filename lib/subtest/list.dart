import 'package:subway_pro/subtest/sub.dart';
import 'package:subway_pro/subtest/sub_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListWidget extends StatelessWidget {
  ListWidget({Key? key}) : super(key: key);

  late SubProvider _subProvider; // SubProvider 호출
  Widget _makeSubOne(Sub sub) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 출발역
                Text(
                  "출발역 : " + sub.start_st.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),

                // 도착역
                Text(
                  "도착역 : " + sub.end_st.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),

                // 출발 시간
                Text(
                  "출발 시간 : " + sub.dept_time.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),

                // 도착 시간
                Text(
                  "도착 시간 : " + sub.arrv_time.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),

                // 소요시간
                Text(
                  "소요 시간 : " + sub.time.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),

                // 요일
                Text(
                  "요일 : " + sub.week.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),

                // 환승횟수
                Text(
                  "환승 횟수 : " + sub.transfer.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),

                // 경로 역사명
                Text(
                  "경로 역사명 : " + sub.station_nm.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),

                // 호선 번호
                Text(
                  "호선 번호 : " + sub.line_num.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),

                // 운임요금
                Text(
                  "운임 요금 : " + sub.fee.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  // 리스트 뷰
  Widget _makeListView(List<dynamic> subs) {
    return ListView.separated(
      itemCount: subs.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 300, color: Colors.white, child: _makeSubOne(subs[index]));
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
      );
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of 를 통해 데이터를 접근한다. builder만을 업데이트 하기위해 listen은 false로 한다.
    _subProvider = Provider.of<SubProvider>(context, listen: false);
    _subProvider.loadSubs(); // SubProvider에 loadSubs()의 접근

    return Scaffold(
      appBar: AppBar(
        title: Text("Sub Provider"),
      ),
      // Consumer를 통해 데이터를 접근
       body: Consumer<SubProvider>(builder: (context, provider, wideget) {
          // 데이터가 있으면 _makeListView에 데이터를 전달
          if (provider.subs != null && provider.subs.length > 0) {
            return _makeListView(provider.subs);
          }

          // 데이터가 없으면 CircularProgressIndicator 수행(로딩)
          return Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}