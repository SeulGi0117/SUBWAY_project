import 'package:subway_pro/subtest/sub.dart';
import 'package:subway_pro/subtest/sub_provider.dart';
import 'package:flutter/material.dart';
import 'package:subway_pro/subtest/sub_repository.dart';

class SubProvider extends ChangeNotifier {
  // SubRepoitory를 접근(데이터를 받아와야 하기 때문에)
  SubRepoitory _subRepoitory = SubRepoitory();

  List<Sub> _subs = [];
  List<Sub> get subs => _subs;

  // 데이터 로드
  loadSubs() async {
    // SubRepoitory 접근해서 데이터를 로드
    // listSubs에 _subs를 바로 작성해도 되지만 예외 처리와 추가적인 가공을 위해 나눠서 작성한다
    List<Sub>? listSubs = await _subRepoitory.loadSubs();
    _subs = listSubs!;
    notifyListeners();
  }
}