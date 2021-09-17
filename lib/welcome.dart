import 'dart:io';
import 'package:degree/additional.dart';
import 'package:degree/home.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'main.dart';



class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Padding(
        padding: const EdgeInsets.symmetric(horizontal : 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height : 127 ),
            SizedBox(width : MediaQuery.of(context).size.width , height : 300 ,child: Image.asset("assets/image/기타/환영해요.png")),
            SizedBox(height : 42 ),
            Text("반가워요 이로사님!", textAlign: TextAlign.center,
                style : TextStyle(color : Color(0xff4271ff), fontSize: 21, fontFamily: 'Gmarket', fontWeight: FontWeight.w700)),
            SizedBox(height : 35 ),
            Text("매일 잊지 않고 복용하여 간편하게 체크하고\n나만의 건강한 복약 습관을 길러보아요", textAlign: TextAlign.center,
              style: TextStyle(color : Color(0xff6b6b6b), fontSize: 14, fontWeight: FontWeight.w400),),
            Expanded(child:Container()),
            Container(height : 48, width :324, child: ElevatedButton(
                style : ElevatedButton.styleFrom(
                    shape : RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                    primary: Color(0xff4271ff),
                    onPrimary: Color(0xffffffff),
                    padding : EdgeInsets.zero
                ),
                onPressed: (){
                  Get.to(()=>Home());
                }, child: Text("홈으로", style: TextStyle(color : Color(0xffffffff),fontSize: 14,fontFamily: 'Gmarket',),textAlign: TextAlign.center,)))
            ,SizedBox(height : 17)
          ],
        ),
      ),

    );



  }



}