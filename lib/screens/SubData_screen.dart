import 'package:flutter/material.dart';
import 'package:subway_pro/models/data.dart';

class SubDataScreen extends StatefulWidget {
  const SubDataScreen({super.key});

  @override
  State<SubDataScreen> createState() => _SubDataScreenState();
}

class _SubDataScreenState extends State<SubDataScreen> {
  List<Sub> sub = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
