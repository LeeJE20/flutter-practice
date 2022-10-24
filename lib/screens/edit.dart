import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

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
            IconButton(onPressed: () {}, icon: const Icon(Icons.save))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: const <Widget>[
              TextField(
                // obscureText: true, // 비번 **로 나옴
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    hintText: '제목'),
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
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
}
