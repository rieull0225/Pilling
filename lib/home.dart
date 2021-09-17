import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onBoarding.dart';
import 'package:flutter/services.dart';
import 'package:degree/search_result.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body : Stack(
        children: [
          Image.asset("assets/image/home/홈_배경_동그라미.png"),
          Column(
            children: [
              Text("hello")
            ],
          )

        ],
      )
    );
  }
}
