import 'dart:io';
import 'package:degree/additional.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';



class dataReceiveComplete extends StatefulWidget {
  const dataReceiveComplete({Key? key}) : super(key: key);

  @override
  _dataReceiveCompleteState createState() => _dataReceiveCompleteState();
}

class _dataReceiveCompleteState extends State<dataReceiveComplete> {



  _dataReceiveCompleteState(){
    sleep(const Duration(milliseconds: 500));
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
              child: Image.asset("assets/image/general/의료데이터 도착.png")),
          Text("의료데이터가\n안전하게 도착했어요!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff4271ff),
                  fontSize: 21,
                  fontFamily: 'Gmarket',
                  fontWeight: FontWeight.w700)),
          SizedBox(height: 29),
          Text("효과적인 서비스 사용을 위해\n추가정보를 입력해주세요.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xff6b6b6b),
                fontSize: 14,
                fontWeight: FontWeight.w400),),
          Expanded(child :Container()),
          Container(height : 48, width :324, child: ElevatedButton(
              style : ElevatedButton.styleFrom(
                  shape : RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                  primary: Color(0xff4271ff),
                  onPrimary: Color(0xffffffff),
                  padding : EdgeInsets.zero
              ),
              onPressed: (){
                Get.to(()=>additional());
              }, child: Text("다음", style: TextStyle(color : Color(0xffffffff),fontSize: 14,fontFamily: 'Gmarket',),textAlign: TextAlign.center,))),
          SizedBox(height : 17)
        ],
      ),

    );
  }



}


