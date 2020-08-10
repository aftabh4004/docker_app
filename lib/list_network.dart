import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListNetwork extends StatelessWidget {
  String output = "";
  ListNetwork() {
    getlist();
  }

  getlist() async {
    String url =
        "http://192.168.29.76/cgi-bin/command.py?cmd=docker network ls";
    var r = await http.get(url);
    print(r.body);
    output = r.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Network List"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                scrollable: true,
                content: Container(
                  child: Text(output),
                ),
              ),
            );
          },
          child: Text("Show"),
        ),
      ),
    );
  }
}
