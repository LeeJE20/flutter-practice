import 'package:flutter/material.dart';

import 'edit.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: Text('메모메모', style: TextStyle(fontSize: 36, color: Colors.blue),))

            ],
          ),
          ...LoadMemo() // 모든 항목에 함수 적용
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => EditPage()));
        },
        tooltip: '메모를 추가하려면 클릭하세요',
        label: Text("메모 추가"),
        icon: Icon(Icons.add),
      ),
    );
  }

  List<Widget> LoadMemo() {
    List<Widget> memoList = [];
    memoList.add(Container(color: Colors.greenAccent, height: 70));
    memoList.add(Container(color: Colors.limeAccent, height: 70));
    return memoList;
  }

}

