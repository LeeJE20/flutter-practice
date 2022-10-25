import 'package:flutter/material.dart';

import 'edit.dart';

import 'package:my_flutter/database/db.dart';
import 'package:my_flutter/database/memo.dart';

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
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 20, top: 50, bottom: 20),
              child: Text(
                '메모메모',
                style: TextStyle(fontSize: 36, color: Colors.blue),
              )),
          Expanded(child: memoBuilder()),
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

  Future<List<Memo>> loadMemo() async {
    DBHelper sd = DBHelper();
    return await sd.memos();
  }

  Widget memoBuilder() {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.data!.isEmpty) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container(child: Text("메모를 지금 바로 추가해보세요!"));
        }
        return ListView.builder(
          itemCount: projectSnap.data?.length,
          itemBuilder: (context, index) {
            Memo memo = projectSnap.data![index];
            return Column(
              children: <Widget>[
                Text(memo.title!),
                Text(memo.text!),
                Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(memo.editTime!))
                // Widget to display the list of project
              ],
            );
          },
        );
      },
      future: loadMemo(),
    );
  }
}
