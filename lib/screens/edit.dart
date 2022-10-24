import 'package:flutter/material.dart';
import 'package:my_flutter/database/memo.dart';
import 'package:my_flutter/database/db.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method

class EditPage extends StatelessWidget {
  // const EditPage({Key? key}) : super(key: key);
  String title = '';
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            IconButton(onPressed: saveDB, icon: const Icon(Icons.save))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                // obscureText: true, // 비번 **로 나옴
                onChanged: (String title) {this.title = title;},
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    hintText: '제목'),
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                onChanged: (String text) {this.text = text;},
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  // border: OutlineInputBorder(),
                    hintText: '내용'),
              ),
            ],
          ),
        ));
  }

  String str2Sha512(String text) {
    var bytes = utf8.encode(text); // data being hashed

    var digest = sha512.convert(bytes);

    return digest.toString();
  }

  Future<void> saveDB() async{

    DBHelper sd = DBHelper();

    var fido = Memo(
      id: str2Sha512(DateTime.now().toString()),
      title: this.title,
      text: this.text,
      createTime: DateTime.now().toString(),
      editTime: DateTime.now().toString(),
    );

    await sd.insertMemo(fido);

    print(await sd.memos());

  }



}
