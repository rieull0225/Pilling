
import 'dart:async';
import 'package:degree/dataReceiveComplete.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class dataReceivePage extends StatefulWidget {
  const dataReceivePage({Key? key}) : super(key: key);

  @override
  dataReceivePageState createState() => dataReceivePageState();
}
class dataReceivePageState extends State<dataReceivePage> {


  int counter= 1;
  dataReceivePageState() {
    Timer(Duration(milliseconds: 500), () {
      Get.to(() => dataReceiveComplete());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100 ),
          SizedBox(width: MediaQuery.of(context).size.width ,
              height: 350 ,
              child: Image.asset("assets/image/general/의료데이터조회완료.png")),
          SizedBox(height: 34 ),
          Text("해당 병원에서 의료 데이터를\n받아오는 중입니다" + ('.' * counter),
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff4271ff),
                  fontSize: 21,
                  fontFamily: 'Gmarket',
                  fontWeight: FontWeight.w700)),
          SizedBox(height: 29),
          Text("시간이 조금 걸릴 수 있으니\n어플을 종료하지 마시고 잠시만 기다려주세요",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xff6b6b6b),
                fontSize: 14,
                fontWeight: FontWeight.w400),)
        ],
      ),

    );
  }
  }


