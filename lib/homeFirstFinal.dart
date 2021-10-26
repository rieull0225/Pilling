import 'package:degree/alarmList.dart';
import 'package:degree/drugFail.dart';
import 'package:degree/drugOK.dart';
import 'package:degree/prescription.dart';
import 'package:degree/reservation.dart';
import 'package:degree/sideEffect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:get/get.dart';
import 'package:degree/AIEnter.dart';
import 'package:intl/intl.dart';

import 'assets.dart';
import 'drug2OK.dart';
import 'notification.dart';

String dateFormat = DateFormat('EEEE').format(DateTime.now());
bool prep = true;
bool side = true;

class homeFirstFinal extends StatefulWidget {
  const homeFirstFinal({Key? key}) : super(key: key);

  @override
  _homeFirstFinalState createState() => _homeFirstFinalState();
}

class _homeFirstFinalState extends State<homeFirstFinal> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height : MediaQuery.of(context).size.height,
        width : MediaQuery.of(context).size.width,
        child: Scaffold(
          body:ListView(
            children: [
              Stack(
                children: [
                  SizedBox(width : MediaQuery.of(context).size.width,
                      child: Image.asset('assets/image/home/홈_배경.png')),
                  Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18, 29,18,0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap:(){
                                    Get.dialog(Dialog2());
                                  },
                                  child: SizedBox( width : 92, height : 24,child: Image.asset('assets/image/general/로고_가로형_white.png'))),
                              SizedBox(height : 29),
                              Text(formatDate(DateTime.now(),[mm,'월',dd,'일',]) +" "+dateFormat, style : TextStyle(color : Colors.white, fontSize: 16,fontWeight: FontWeight.w300, fontFamily: 'Gmarket')),
                              SizedBox(height : 13),
                              Text("안녕하세요 이로사님!\n오늘의 필잉은 어떤가요?", style : TextStyle(color : Colors.white, fontSize : 22, fontFamily: 'Gmarket')),
                              SizedBox(height : 18),
                              Row(
                                children: [
                                  TextButton( child : Text('복약체크', style: TextStyle(color : Colors.white,fontSize: 16, fontFamily: 'Gmarket', fontWeight: side ? FontWeight.w700 :FontWeight.w500),),
                                    onPressed: (){
                                      setState(() {
                                        side = true;
                                      });
                                    },),
                                  SizedBox(width : 16),
                                  TextButton(child : Text('부작용 노트',style: TextStyle(color : Colors.white,fontSize: 16, fontFamily: 'Gmarket', fontWeight: side ? FontWeight.w500 : FontWeight.w700),),
                                    onPressed: (){
                                      setState(() {
                                        side = false;
                                        if(sides.isEmpty)
                                          Get.dialog(Dialog2());
                                      });
                                    },),
                                ],
                              ),
                              SizedBox(height : 11),
                              side == false ? SideEffect() :GestureDetector(
                                onTap : (){
                                  setState(() {

                                  });
                                },
                                child : isSet ? beforeSet() : afterSet(),
                              ),
                              SizedBox(height : 35),
                              Text("정확하고 간편한 증상 전달!\n필잉의 특별한 비대면진료를 이용해보세요.",style: TextStyle(fontFamily:'Gmarket', color : Color(0xff3d3d3d), fontWeight: FontWeight.w500 , fontSize: 17)),
                              SizedBox(height : 18),
                            ],),),

                        isSet ? prepButton(context) : SizedBox(),
                        Padding(
                          padding: const EdgeInsets.only(left :18.0),
                          child: Column(
                            children:[
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
                              SizedBox(height :105),
                            ],
                          ),
                        ),
                      ]
                  ),
                ],
              ),


            ],
          ),
        ));
  }


  Widget SideEffect(){
    int n = sides.length;
    return Padding(
      padding: const EdgeInsets.only(left : 8.0),
      child: Container(
          width :350, height : 207,
          child : sides.isEmpty ? Container() :
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for(int i = n-1; i > n-4 ; --i)
                if(i >= 0)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(child: Container()),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text("${sides[n-1].time?[0]}:${sides[i].time?[1]}", style: TextStyle(color: Color(0xff6691ff), fontSize: 14, fontWeight: FontWeight.w300),),
                        ),
                        SizedBox(width : 12),
                        Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(color : Colors.grey.withOpacity(0.5),
                                    blurRadius: 20, offset: Offset(0,8))
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color : Colors.white,
                            ),
                            width : 240,height :61,
                            child : Padding(
                              padding: const EdgeInsets.fromLTRB(18,12,18,10),
                              child: Row(

                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${sides[i].name}", style: TextStyle(color: Color(0xff141922), fontSize: 15, fontWeight: FontWeight.w500),),
                                      Text("${sides[i].level} | ${sides[i].desc}", style: TextStyle(color: Color(0xfff37981), fontSize: 12, fontWeight: FontWeight.w300),)
                                    ],
                                  ),
                                  Expanded(child: Container()),
                                  GestureDetector(
                                      onTap: (){
                                        Get.to(SideEff(), arguments: i);
                                        setState(() {
                                        });
                                      },
                                      child: SizedBox(height: 34, width: 34, child : Image.asset('assets/image/general/부작용기록.png')))
                                ],
                              ),
                            )
                        ),
                      ],
                    ),
                  ),

            ],
          )

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
        width : MediaQuery.of(context).size.width,
        child : GestureDetector( onTap: (){
          Get.to(()=>prescription());
        },
          child : Image.asset("assets/image/home/홈_진료배너2.png"),
        ));
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
            GestureDetector(
                onTap: (){
                  setState(() {
                    isSet = true;
                    Get.to(()=>notification());
                  });
                },
                child: SizedBox(height : 104, width : 120, child: Image.asset("assets/image/home/홈_최초배너.png"))),
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
                      Text("${drugs[0].name} 2mg 1정", style : TextStyle(color : Color(0xff3d3d3d,), fontSize: 15)),
                      Text("21년 10월 21일부터 11일째 먹고 있어요.", style : TextStyle(color : Color(0xff6b6b6b), fontSize : 12))
                    ],
                  ),
                  Expanded(child: Container()),
                  drugs[0].before ? Row(children: [
                    GestureDetector(
                        onTap:(){
                          setState(() {
                            drugs[0].before = false;
                            drugs[0].okay = false;
                            Get.to(()=>drugFail());
                          });

                        },
                        child: SizedBox(height : 34, width : 34, child : Image.asset("assets/image/home/홈_복용확인X.png"))),
                    SizedBox(width : 12),
                    GestureDetector(
                        onTap:(){
                          setState(() {
                            drugs[0].before = false;
                            drugs[0].okay = true;
                            Get.to(()=>drug2OK());
                          });
                        },
                        child: SizedBox(height : 34, width : 34, child : Image.asset("assets/image/home/홈_복용확인V.png"))),
                  ],) : drugs[0].okay ?SizedBox(height : 34, width : 34, child : Image.asset("assets/image/home/홈_복용완료.png")): SizedBox(height : 34, width : 34, child : Image.asset("assets/image/home/홈_복용실패.png")),

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
                      Row(
                        children: [
                          SizedBox(width : 14, height : 14, child: Image.asset('assets/image/home/홈_복용예정.png')),
                          SizedBox(width : 6),
                          Text("07:30am 복용 예정", style : TextStyle(color : Color(0xff929292), fontSize: 13,fontWeight: FontWeight.w300,fontFamily: 'Apple')),
                        ],
                      ),
                      Text("${drugs[1].name} 2mg 1정", style : TextStyle(color : Color(0xff3d3d3d,), fontSize: 15)),
                      Text("21년 10월 3일부터 23일째 먹고 있어요.", style : TextStyle(color : Color(0xff6b6b6b), fontSize : 12))
                    ],
                  ),
                  Expanded(child: Container()),
                  drugs[1].before ? Row(children: [
                    GestureDetector(
                        onTap:(){
                          setState(() {
                            drugs[1].before = false;
                            drugs[1].okay = false;
                            Get.to(()=>drugFail());
                          });

                        },
                        child: SizedBox(height : 34, width : 34, child : Image.asset("assets/image/home/홈_복용확인X.png"))),
                    SizedBox(width : 12),
                    GestureDetector(
                        onTap:(){
                          setState(() {
                            drugs[1].before = false;
                            drugs[1].okay = true;
                            Get.to(()=>drugOK());
                          });

                        },
                        child: SizedBox(height : 34, width : 34, child : Image.asset("assets/image/home/홈_복용확인V.png"))),
                  ],) : drugs[1].okay ?SizedBox(height : 34, width : 34, child : Image.asset("assets/image/home/홈_복용완료.png")): SizedBox(height : 34, width : 34, child : Image.asset("assets/image/home/홈_복용실패.png")),

                ],
              ),
            )
        ),
      ],
    );
  }
  Widget Dialog2(){
    return Stack(
        children: [
          Center(
              child: GestureDetector(
                onTap: (){
                  Get.back();
                  Get.to(()=>SideEff());
                },
                child: Container(
                  height : 384,
                  width: 290,
                  child: Image.asset("assets/image/Record/부작용기록없을때팝업.png"),


                ),
              )
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height : 275,
                ),
                GestureDetector(
                  onTap:(){
                    Get.back();
                  },
                  child: Container(
                    width : 290,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xff4271ff),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(
                        "확인",
                        style: TextStyle(color: Colors.white, fontSize: 14, decoration: TextDecoration.none),
                        textAlign: TextAlign.center,

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]
    );
  }


}

