import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work/model/PostResponse.dart';

import '../http/MyDio.dart';

class Searchpage extends StatefulWidget {
  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  MyDio myDio = MyDio();
  Future getData() async {
    try {
      Response response =
          await myDio.get("https://yapi.pro/mock/42579/showPublishedPost");
      print(response.data);
      PostResponse postResponse = PostResponse.fromJson(response.data);
    } catch (error) {
      print("请求失败");
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.green);
    return Scaffold(
      appBar: AppBar(
        title: Text("全部帖子"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("$index"));
            },
            separatorBuilder: (BuildContext context, int index) {
              return index % 2 == 0 ? divider1 : divider2;
            },
          )
        ],
      )),
    );
  }
}
