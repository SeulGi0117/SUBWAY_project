import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:csv/csv.dart';

// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/services.dart';
import 'package:subway_pro/main.dart';
import 'HomePage.dart';

class testscreens extends StatefulWidget{
testscreens({super.key});

@override
State<testscreens> createState() =>_testscreensState();
}

class _testscreensState extends State<testscreens>{
   @override
  void initState() {
    super.initState();
    _downloadCsv();
  }


  Future<void> _downloadCsv() async {
     final String url = "apis.data.go.kr";
    final String path = "/B553766/smt-path/path";
   var csvRead = await  http.post(
        Uri.parse(
            "https://apis.data.go.kr/B553766/smt-path/path?serviceKey=4fskVJh2CpFFANbJ0JCuuX0%2F90cRzEKtJAdFvkgjcZyq%2F6bd%2BWlBvJD8IZuwtFaTGK7ku4VvkcyJx05A9rK7cg%3D%3D&pageNo=1&numOfRows=10&dept_station_code=2728&dest_station_code=0214&week=DAY&search_type=FASTEST&dept_time=120001",
        )
   );
    try {
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DataTablePage(csvString: csvRead)),
      );
    } catch(e) {
      print('download error:$e');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DataTable Demo'),
        ),
        body: Center(
          child: Text('loading...', style: TextStyle(fontSize: 50.0),),
        )
    );
  }
}
class DataTablePage extends StatefulWidget {
  final csvString;

  const DataTablePage({super.key, required this.csvString});
  @override
  _DataTablePageState createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage> {
   late List<String> csvRows;
  late List<String> csvHeadingRow;

  @override
  void initState() {
    super.initState();
    List<String> csvSplit = widget.csvString.split('\n');
    csvHeadingRow = csvSplit[0].split(',');
    csvSplit.removeAt(0);
    csvRows = csvSplit;
  }

  void _dataColumnSort(int columnIndex, bool ascending) {
    print('_dataColumnSort() $columnIndex, $ascending');
  }

  List<DataColumn> _getColumns() {
    List<DataColumn> dataColumn = [];
    for (var i in csvHeadingRow) {
      if (i == 'rank') {
        dataColumn.add(DataColumn(label: Text(i), tooltip: i, numeric: true, onSort: _dataColumnSort));
      } else {
        dataColumn.add(DataColumn(label: Text(i), tooltip: i));
      }
    }
    return dataColumn;
  }

  List<DataRow> _getRows() {
    List<DataRow> dataRow = [];
    for (var i=0; i<=csvRows.length-1; i += i+150) {
      var csvDataCells = csvRows[i].split(',');
      List<DataCell> cells = [];
      for(var j=0; j<=csvDataCells.length-1; j+= j+150) {
        cells.add(DataCell(Text(csvDataCells[j])));
      }
      dataRow.add(DataRow(cells: cells));
    }
    return dataRow;
  }

  Widget _getDataTable() {
    return DataTable(
      horizontalMargin: 12.0,
      columnSpacing: 28.0,
      columns: _getColumns(),
      rows: _getRows(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DataTable Demo'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: _getDataTable(),
          ),
        )
    );
  }
}
  
