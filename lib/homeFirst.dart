import 'package:degree/drugFail.dart';
import 'package:degree/drugOK.dart';
import 'package:degree/reservation.dart';
import 'package:degree/sideEffect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:get/get.dart';
import 'package:degree/AIEnter.dart';
import 'package:intl/intl.dart';

import 'assets.dart';

String dateFormat = DateFormat('EEEE').format(DateTime.now());
bool isSet = false;
bool prep = true;
bool side = true;
class homeFirst extends StatefulWidget {
  const homeFirst({Key? key}) : super(key: key);

  @override
  _homeFirstState createState() => _homeFirstState();
}


class _homeFirstState extends State<homeFirst> {
  @override


  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(width : MediaQuery.of(context).size.width,
            child: Image.asset('assets/image/home/홈_배경.png')),
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 68,18,0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox( width : 92, height : 24,child: Image.asset('assets/image/general/로고_가로형_white.png')),
              SizedBox(height : 27),
              Text(formatDate(DateTime.now(),[mm,'월',dd,'일',]) +" "+dateFormat, style : TextStyle(color : Colors.white, fontSize: 16,fontWeight: FontWeight.w300, fontFamily: 'Gmarket')),
              SizedBox(height : 13),
              Text("안녕하세요 이로사님!\n오늘의 필잉은 어떤가요?", style : TextStyle(color : Colors.white, fontSize : 22, fontFamily: 'Gmarket')),
              SizedBox(height : 24),
              Row(
                children: [
                  TextButton( child : Text('복약체크', style: TextStyle(color : Colors.white, fontFamily: 'Gmarket', fontWeight: FontWeight.w700),),
                    onPressed: (){
                    setState(() {
                      side = true;
                    });
                  },),
                  SizedBox(width : 20),
                  TextButton(child : Text('부작용 노트',style: TextStyle(color : Colors.white, fontFamily: 'Gmarket', fontWeight: FontWeight.w500),),
                    onPressed: (){
                      setState(() {
                        side = false;
                      });
                    },),
                ],
              ),
              SizedBox(height : 11),
              side == false ? SideEffect() :GestureDetector(
                onTap : (){
                  setState(() {
                    isSet = true;
                    //isSet = true;
                  });
                },
                child : isSet ? beforeSet() : afterSet(),
              ),
              SizedBox(height : 45),
              Text("정확하고 간편한 증상 전달!\n필잉의 특별한 비대면진료를 이용해보세요.",style: TextStyle(fontFamily:'Gmarket', color : Color(0xff3d3d3d), fontWeight: FontWeight.w500 , fontSize: 16)),
              SizedBox(height : 18),
              isSet == false ? prepButton(context) : SizedBox(),
              SizedBox(height : 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BookButton(),
                  SizedBox(width : 10),
                  EnterButton()
                ],),
              SizedBox(height : 17),
              Text(" ※ 서비스 내 일정 조건이 충족되어야 비대면 진료가 가능합니다.", style : TextStyle(color : Color(0xff4271ff),fontSize: 11, fontWeight: FontWeight.w400),),
              SizedBox(height :30),
            ],
          ),
        ),


      ],
    );
  }
}

Widget SideEffect(){
  return Padding(
    padding: const EdgeInsets.only(left : 8.0),
    child: Container(
      width :350, height : 204,
      child : GestureDetector(
        onTap:(){
          Get.to(SideEff());
        },
          child: Image.asset("assets/image/home/side.png",fit:BoxFit.cover)),
    ),
  );
}

Widget BookButton(){
  return GestureDetector(
    onTap:(){Get.to(reservation(),arguments: inform(name : '마음샘정신건강의학과',doctor : ['김진규', '곽은진'], address : '서울시 서초구 서초동 1673-1 인앤인빌딩 502',phone : '02-522-6836'));},
    child: Container(
      width : 156, height : 171,
      decoration: BoxDecoration(color : Color(0xfff6f8ff),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color : Colors.grey.withOpacity(0.3), spreadRadius: 5, blurRadius: 7)]),
      child : Padding(
        padding: const EdgeInsets.fromLTRB(16,16,0,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("전화/화상 진료\n예약하기 >", style : TextStyle(color : Color(0xff4271ff),fontSize: 16, fontWeight: FontWeight.w400),),
            SizedBox(width : 145, height: 107,
                child: Image.asset("assets/image/home/예약.png",),),
          ],
        ),
      )
    ),
  );
}

Widget EnterButton(){
  return GestureDetector(
    onTap:(){},
    child: InkWell(
      onTap: (){
        Get.to(AIEnter());
      },
      child: Container(
          width : 156, height : 171,
          decoration: BoxDecoration(color : Color(0xfff6f8ff),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color : Colors.grey.withOpacity(0.3), spreadRadius: 5, blurRadius: 7)]),
          child : Padding(
            padding: const EdgeInsets.fromLTRB(16,16,0,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("AI 챗봇 진료실\n입장하기 >", style : TextStyle(color : Color(0xff4271ff),fontSize: 16, fontWeight: FontWeight.w400),),
                Expanded(child : SizedBox()),
                SizedBox(width : 134, height: 94,
                  child: Image.asset("assets/image/home/입장.png",),),
              ],
            ),
          )
      ),
    ),
  );
}

Widget prepButton(BuildContext context){
  return SizedBox(
    height : 50, width : MediaQuery.of(context).size.width,
    child : GestureDetector( onTap: (){},
      child : Image.asset("assets/image/home/홈_진료배너2.png",fit: BoxFit.fitWidth,)),
   );
}

Widget afterSet(){
  return Container(
      width : 312, height : 204,
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color : Colors.grey.withOpacity(0.3), spreadRadius: 5, blurRadius: 7)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height : 20),
          SizedBox(height : 104, width : 120, child: Image.asset("assets/image/home/홈_최초배너.png")),
          Text("복용 시간을 설정해주세요!",style: TextStyle(color : Color(0xffff5b64), fontWeight: FontWeight.w300 , fontSize: 15)),
          SizedBox(height : 7),
          Text("매일 잊지 않고 복용하는 것이 건강한 필잉의 첫 시작입니다:)", style: TextStyle(color : Color(0xff929292), fontWeight: FontWeight.w300 , fontSize: 11))
        ],
      )
  );
}


Widget beforeSet(){
  return Column(
    children: [
      Container(
        width : 312, height : 83,
        decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color : Colors.grey.withOpacity(0.3), spreadRadius: 5, blurRadius: 7)]),
        child : Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width : 14, height : 14, child: Image.asset('assets/image/home/홈_복용예정.png')),
                      SizedBox(width : 6),
                      Text("10:00am 복용 예정", style : TextStyle(color : Color(0xff929292), fontSize: 13,fontWeight: FontWeight.w300,fontFamily: 'Apple')),
                    ],
                  ),
                  Text("아빌리파이 2mg 1정", style : TextStyle(color : Color(0xff3d3d3d,), fontSize: 15)),
                  Text("21년 07월 08일부터 11일째 먹고 있어요.", style : TextStyle(color : Color(0xff6b6b6b), fontSize : 12))
                ],
              ),
              SizedBox(width : 10),
              GestureDetector(
                  onTap:(){
                    Get.to(()=>drugFail());
                  },
                  child: SizedBox(height : 34, width : 34, child : Image.asset("assets/image/home/홈_복용확인X.png"))),
              SizedBox(width : 12),
              GestureDetector(
                onTap:(){
                  Get.to(()=>drugOK());
                },
                  child: SizedBox(height : 34, width : 34, child : Image.asset("assets/image/home/홈_복용확인V.png"))),
            ],
          ),
        )
      ),
      SizedBox(height : 8 ),
      Container(
          width : 312, height : 83,
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color : Colors.grey.withOpacity(0.3), spreadRadius: 5, blurRadius: 7)]),
          child : Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("복용 완료 | 08:32am", style : TextStyle(color : Color(0xff4271ff), fontSize: 12,fontWeight: FontWeight.w300,fontFamily: 'Apple')),
                    Text("콘서타OROS27mg 1정", style : TextStyle(color : Color(0xff4271ff,), fontSize: 15)),
                    Text("21년 06월 28일부터 23일째 먹고있어요.", style : TextStyle(color : Color(0xff6b6b6b), fontSize : 12))
                  ],
                ),
                SizedBox(width : 10),
                SizedBox(height : 34, width : 34),
                SizedBox(width : 12),
                GestureDetector(
                  onTap:(){
                    Get.to(()=>drugOK());
                  },
                    child: SizedBox(height : 34, width : 34, child : Image.asset("assets/image/home/홈_복용완료.png"))),
              ],
            ),
          )
      ),
    ],
  );
}

