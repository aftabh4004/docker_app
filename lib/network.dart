import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class DockerNetwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name, driver, subnet;
    return Scaffold(
        appBar: AppBar(
          title: Text("Network"),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (val) {
                  name = val;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Network Name",
                ),
              ),
              TextField(
                onChanged: (val) {
                  driver = val;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Driver (default : bridge)",
                ),
              ),
              TextField(
                onChanged: (val) {
                  subnet = val;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Subnet (default: Random)",
                ),
              ),
              RaisedButton(
                onPressed: () async {
                  if (name == null) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        scrollable: true,
                        content: Container(
                          child: Text("Name can't be empty " +
                              "\nTouch outside to go back"),
                        ),
                      ),
                    );
                  } else {
                    String url =
                        "http://192.168.29.76/cgi-bin/docker_network.py?name=$name&driver=$driver&subnet=$subnet";
                    var r = await http.get(url);
                    print(r.statusCode);
                    print(r.body);

                    String msg;
                    Color col;

                    if (r.statusCode == 200) {
                      msg = "Network Created!";
                      col = Colors.green;
                      Fluttertoast.showToast(
                          msg: msg,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: col,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      msg = "Something went wrong!\n" + r.body;
                      col = Colors.red;
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          scrollable: true,
                          content: Container(
                            child: Text(msg),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                child: Text("Create"),
              )
            ],
          ),
        ));
  }
}
