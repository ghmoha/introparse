import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {

  List _data = await getJson();

//  print(_data[0]['id']);

  for(int i = 0; i < _data.length; i++){
    print(_data[i]['title']);
  }
  runApp(new MaterialApp(
    title: "JSON PArsing",
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("JSON Parse"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: new Center(
        child: new Text("Parsing..r."),
      ),
    )
  )
  );   
}

Future<List> getJson() async {
  String apiUrl = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(apiUrl);

  return json.decode(response.body);
}