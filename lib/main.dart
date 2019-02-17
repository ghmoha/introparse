import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  String _body = '';
  List _data = await getJson();

//  print(_data[0]['id']);

  _body = _data[0]["title"];
  runApp(new MaterialApp(
      title: "JSON PArsing",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("JSON Parse"),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: new Center(
            child: new ListView.builder(
                itemCount: _data.length,
                padding: const EdgeInsets.all(3.5),
                itemBuilder: (BuildContext context, int position) {
                  return Column(
                    children: <Widget>[
                      new Divider(height: 5.5),
                      new ListTile(
                        title: Text(
                          "${_data[position]['title']}",
                          style: TextStyle(fontSize: 18.5),
                        ),
                        subtitle: Text("${_data[position]['body']}",
                            style: TextStyle(
                                fontSize: 13.5,
                                color: Colors.grey,
                                fontStyle: FontStyle.italic)),
                        leading: new CircleAvatar(
                          backgroundColor: Colors.orangeAccent,
                          child: Text(
                            "${_data[position]['body'][0]}".toUpperCase(),
                            style: TextStyle(
                                fontSize: 19.5, color: Colors.blueAccent),
                          ),
                        ),
                        onTap: () => _showonTabMessage(context, _data[position]['body']),
                      )
                    ],
                  );
                })),
      )));
}

void _showonTabMessage(BuildContext context, String message){
  var alert = AlertDialog(
    title: Text("My APP"),
    content: Text(message),
    actions: <Widget>[
      FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(context);
        },)
    ],
  );
  //showDialog(context: context, child: alert);
  showDialog(context: context, builder: (context) => alert);
}

Future<List> getJson() async {
  String apiUrl = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(apiUrl);

  return json.decode(response.body);
}
