import 'package:docker_app/delete_network.dart';
import 'package:docker_app/list_network.dart';
import 'package:docker_app/network.dart';
import 'package:flutter/material.dart';

homepage(context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Dashboard"),
    ),
    body: Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                //margin: EdgeInsets.symmetric(horizontal: 30),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DockerNetwork(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 20,
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        Image.asset(
                          "images/bg_networking.jpg",
                          fit: BoxFit.fill,
                        ),
                        Center(
                          child: Text(
                            "Create a Docker Network",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                //margin: EdgeInsets.symmetric(horizontal: 30),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeleteNetwork(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 20,
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        Image.asset(
                          "images/bg_networking.jpg",
                          fit: BoxFit.fill,
                        ),
                        Center(
                          child: Text(
                            "Remove a Docker Network",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListNetwork(),
                  ),
                );
              },
              child: Card(
                elevation: 20,
                child: Stack(
                  fit: StackFit.expand,
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Image.asset(
                      "images/Blue-Background-300x200.jpg",
                      fit: BoxFit.fill,
                    ),
                    Center(
                      child: Text(
                        "List Docker Network",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
