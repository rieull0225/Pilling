import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          SizedBox(width : 200, height : 200,
              child: Image.asset('assets/image/AI진료/AI진료프로필.png')),
          Column(
            children: [
              Text("hello"),
              Image.asset('assets/image/AI진료/AI진료프로필.png'),
              Image.asset('assets/image/기타/온보딩1.png'),
              Image.asset('assets/image/하단바/하단바_홈_활성.png')

            ],
          )

        ],
      )
    );
  }
}
