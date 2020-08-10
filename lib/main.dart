import 'package:docker_app/home.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  build(BuildContext context) {
    return homepage(context);
  }
}
