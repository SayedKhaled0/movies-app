import 'package:flutter/material.dart';


class Browse_Screen extends StatefulWidget {
  static const String routeName = "dddd";

  @override
  State<Browse_Screen> createState() => _Browse_ScreenState();
}

class _Browse_ScreenState extends State<Browse_Screen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Browse Category",
        ),
      ),
      body: Container(),
    );
  }
}
