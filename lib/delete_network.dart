import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class DeleteNetwork extends StatelessWidget {
  String net;
  getlist() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Remove network"),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  net = value;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Network ID or Name"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () async {
                      String url =
                          "http://192.168.29.76/cgi-bin/command.py?cmd=docker network rm $net";
                      var r = await http.get(url);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          scrollable: true,
                          content: Container(
                            child: Text("Deleted " +
                                r.body +
                                "\nTouch outside to go back"),
                          ),
                        ),
                      );
                    },
                    child: Text("Delete"),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      String url =
                          "http://192.168.29.76/cgi-bin/command.py?cmd=docker network ls";
                      var r = await http.get(url);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          scrollable: true,
                          content: Container(
                            child: Text(r.body + "\nTouch outside to go back"),
                          ),
                        ),
                      );
                    },
                    child: Text("Show List"),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
