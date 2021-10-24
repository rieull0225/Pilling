
import 'package:date_format/date_format.dart';
import 'package:degree/changeHos.dart';
import 'package:degree/homeThirdFinal.dart';
import 'package:degree/request.dart';
import 'package:degree/search_result.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



List<Widget> s1 = [];
List<Widget> e1 = [];

List<String> aaa = ['AM', 'PM'];

class sendPresc extends StatefulWidget {
  const sendPresc({Key? key}) : super(key: key);

  @override
  _sendPrescState createState() => _sendPrescState();
}



class _sendPrescState extends State<sendPresc> {


  _sendPrescState(){
    initList();
  }

  void initList(){
    if(s1.isEmpty) {
      for (int i = 1; i <= 12; ++i) {
        s1.add(Container(width : 106, height : 101 ,child: Center(child: Text("${i}", style : TextStyle(fontSize: 16,fontWeight: FontWeight.w300)))));
      }
      for (int i = 0; i < 60; ++i) {
        e1.add(Container(width : 106, height : 101,child: Center(child: Text("${i}",style : TextStyle(fontSize: 16,fontWeight: FontWeight.w300)))));
      }
    }
  }

  @override
  bool isSel = false;
  bool isSet = false;
  bool inHour = false;
  int date = 0;

  List<bool> day = [false,false,false];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [IconButton(icon: Icon(Icons.arrow_back_ios,),onPressed: (){Get.back();},color: Colors.white,)],
          title : Center(child : Text('처방전 전송하기', style: TextStyle(color : Color(0xff141922), fontSize: 14 ),)),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Color(0xff141922),
            icon: Icon(Icons.arrow_back_ios, size: 16,),
            onPressed: (){Get.back();},
          ),
        ),
        body:Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('조제기관을 확인 후\n약물 픽업 시간을 선택해주세요.',
                    style: TextStyle(color : Color(0xff141922), fontSize: 15, fontFamily: 'Gmarket',fontWeight: FontWeight.w500),),
                  SizedBox(height : 4),
                  Text('※ 해당 조제기관은 진료 받은 병원과 연계되어 있는 약국입니다.',
                    style: TextStyle(color : Color(0xff929292), fontSize: 11, fontFamily: 'Apple',fontWeight: FontWeight.w400),),
                  SizedBox(height : 25),
                  Container(width : MediaQuery.of(context).size.width,
                      height : 147,
                      child :Container(
                        decoration: BoxDecoration(color : Color(0xfff8faff), borderRadius: BorderRadius.circular(10)),
                        child : Padding(
                          padding: const EdgeInsets.fromLTRB(16.0,16,16,0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("조제기관",style: TextStyle(color : Color(0xff6b6b6b), fontSize: 12, ),),
                              SizedBox(height : 8),
                              Text("마음샘정신건강의학과 원내조제",style: TextStyle(color : Color(0xff141922), fontSize: 16, fontWeight: FontWeight.w500, ),),
                              SizedBox(height : 3),
                              Text("서울시 서초구 서초동 1673-1 인앤인빌딩 502호",style: TextStyle(color : Color(0xff6b6b6b), fontSize: 13, ),),
                              SizedBox(height : 11),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('평일',style: TextStyle(color : Color(0xff141922), fontWeight: FontWeight.w300, fontSize: 12),),
                                      Text("08:00 ~ 19:00",style: TextStyle(color : Color(0xff6b6b6b), fontWeight: FontWeight.w300, fontSize: 12),)
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('토요일',style: TextStyle(color : Color(0xff141922), fontWeight: FontWeight.w300, fontSize: 12),),
                                      Text("08:00 ~ 21:00",style: TextStyle(color : Color(0xff6b6b6b), fontWeight: FontWeight.w300, fontSize: 12),)
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('공휴일',style: TextStyle(color : Color(0xfff37981), fontWeight: FontWeight.w300, fontSize: 12),),
                                      Text("휴무",style: TextStyle(color : Color(0xff6b6b6b), fontWeight: FontWeight.w300, fontSize: 12),)
                                    ],
                                  ),
                                  SizedBox(width : 37),
                                ],
                              )


                            ],
                          ),
                        ),
                      )),

                ],
              ),
              SizedBox(height : 20),
              Row(
                children: [
                 IconButton(icon : inHour ? Icon(Icons.check_circle_rounded, color: Color(0xff4271ff),)
                  :Icon(Icons.radio_button_unchecked, color: Color(0xffb8b8b8),), iconSize : 20, onPressed: (){
                    setState(() {
                      inHour = !inHour;
                    });
                  },),
                  Text("1시간 이내로 방문 수령 예정이에요")
                ],
              ),

              Divider(color: Color(0xffdadada), thickness: 0.5,),
              SizedBox(height : 28),
              inHour? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("약물 픽업 예약 시간", style: TextStyle(color : Color(0xffb8b8b8)),),
                  SizedBox(height : 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width : 30, height : 40,
                        child: Column(
                          children: [
                            Text('금',style: TextStyle(color : Color(0xffb8b8b8),fontSize: 12, fontWeight: FontWeight.w300),),
                            SizedBox(height : 3),
                            Text('29', style: TextStyle(color : Color(0xffb8b8b8),fontSize: 12, fontWeight: FontWeight.w300),),
                          ],
                        ),
                      ),
                      Container(
                        width : 30, height : 40,
                        child: Column(
                          children: [
                            Text('토',style: TextStyle(color : Color(0xffb8b8b8),fontSize: 12, fontWeight: FontWeight.w300),),
                            SizedBox(height : 3),
                            Text('30', style: TextStyle(color : Color(0xffb8b8b8),fontSize: 12, fontWeight: FontWeight.w300),),
                          ],
                        ),
                      ),
                      Container(
                        width : 30, height : 40,
                        child: Column(
                          children: [
                            Text('일',style: TextStyle(color : Color(0xffb8b8b8),fontSize: 12, fontWeight: FontWeight.w300),),
                            SizedBox(height : 3),
                            Text('31', style: TextStyle(color : Color(0xffb8b8b8),fontSize: 12, fontWeight: FontWeight.w300),),
                          ],
                        ),
                      ),
                      Container(
                        width : 30, height : 40,
                        child: Column(
                          children: [
                            Text('월',style: TextStyle(color : Color(0xffb8b8b8),fontSize: 12, fontWeight: FontWeight.w300),),
                            SizedBox(height : 3),
                            Text('1', style: TextStyle(color : Color(0xffb8b8b8),fontSize: 12, fontWeight: FontWeight.w300),),
                          ],
                        ),
                      ),
                      Container(
                        width : 30, height : 40,
                        child: Column(
                          children: [
                            Text('화',style: TextStyle(color : Color(0xffb8b8b8),fontSize: 12, fontWeight: FontWeight.w300),),
                            SizedBox(height : 3),
                            Text('2', style: TextStyle(color : Color(0xffb8b8b8),fontSize: 12, fontWeight: FontWeight.w300),),
                          ],
                        ),
                      ),
                      Container(
                        width : 30, height : 40,
                        child: Column(
                          children: [
                            Text('수',style: TextStyle(color : Color(0xffb8b8b8),fontSize: 12, fontWeight: FontWeight.w300),),
                            SizedBox(height : 3),
                            Text('3', style: TextStyle(color : Color(0xffb8b8b8),fontSize: 12, fontWeight: FontWeight.w300),),
                          ],
                        ),
                      ),
                      Container(
                        width : 30, height : 40,
                        child: Column(
                          children: [
                            Text('목',style: TextStyle(color : Color(0xffb8b8b8),fontSize: 12, fontWeight: FontWeight.w300),),
                            SizedBox(height : 3),
                            Text('4', style: TextStyle(color : Color(0xffb8b8b8),fontSize: 12, fontWeight: FontWeight.w300),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height : 20),
                  Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(height : 42),
                          Container(
                              width : 360, height : 30, decoration : BoxDecoration(borderRadius : BorderRadius.circular(5), color : Color(0xfffafafa))
                          ),
                        ],
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children : [
                            Container(height : 113, width :106,
                              child: ListWheelScrollView(
                                squeeze : 1,
                                children : s1,
                                itemExtent: 24,
                              ),
                            ),
                            Container(
                              height : 87,
                              child: DottedLine(
                                direction : Axis.vertical,
                              ),
                            ),
                            Container(height : 113, width : 106,
                              child: ListWheelScrollView(
                                squeeze : 2,
                                children : e1,
                                itemExtent: 60,
                              ),
                            ),
                            Container(
                              height : 87,
                              child: DottedLine(
                                direction : Axis.vertical,
                              ),
                            ),
                            Container(height : 113 , width : 106,
                              child: ListWheelScrollView(
                                squeeze : 0.8,
                                children : [Text("AM", style: TextStyle(fontWeight: FontWeight.w300)), Text("PM", style: TextStyle(fontWeight: FontWeight.w300))],
                                itemExtent: 20,
                              ),
                            ),
                          ]


                      ),
                    ],
                  )
                ],
              ):Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("약물 픽업 예약 시간", style: TextStyle(color : Color(0xff141721)),),
                  SizedBox(height : 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            day[1] = false;
                            day[2] = false;
                            day[0] = !day[0];
                          });
                        },
                        child: Container(
                          decoration: day[0] ? BoxDecoration(
                            color: Color(0xffebf0ff),
                            borderRadius: BorderRadius.circular(10),
                            border : Border.all(color : Color(0xff4271ff)),
                          ) : null,
                          width : 30, height : 40,
                          child: Center(
                            child: Column(
                              children: [
                                Text('금',style: TextStyle(color : Color(0xff141721),fontSize: 12, fontWeight: FontWeight.w300),),
                                SizedBox(height : 3),
                                Text('29', style: TextStyle(color : Color(0xff141721),fontSize: 12, fontWeight: FontWeight.w300),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width : 30, height : 40,
                        child: Column(
                          children: [
                            Text('토',style: TextStyle(color : Color(0xff141721),fontSize: 12, fontWeight: FontWeight.w300),),
                            SizedBox(height : 3),
                            Text('30', style: TextStyle(color : Color(0xffb8b8b8),fontSize: 12, fontWeight: FontWeight.w300),),
                          ],
                        ),
                      ),
                      Container(
                        width : 30, height : 40,
                        child: Column(
                          children: [
                            Text('일',style: TextStyle(color : Color(0xff141721),fontSize: 12, fontWeight: FontWeight.w300),),
                            SizedBox(height : 3),
                            Text('31', style: TextStyle(color : Color(0xffb8b8b8),fontSize: 12, fontWeight: FontWeight.w300),),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            day[0] = false;
                            day[2] = false;
                            day[1] = !day[1];
                          });
                        },
                        child: Container(
                          decoration: day[1] ? BoxDecoration(
                            color: Color(0xffebf0ff),
                            borderRadius: BorderRadius.circular(10),
                            border : Border.all(color : Color(0xff4271ff)),
                          ) : null,
                          width : 30, height : 40,
                          child: Column(
                            children: [
                              Text('월',style: TextStyle(color : Color(0xff141721),fontSize: 12, fontWeight: FontWeight.w300),),
                              SizedBox(height : 3),
                              Text('1', style: TextStyle(color : Color(0xff141721),fontSize: 12, fontWeight: FontWeight.w300),),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width : 30, height : 40,
                        child: Column(
                          children: [
                            Text('화',style: TextStyle(color : Color(0xff141721),fontSize: 12, fontWeight: FontWeight.w300),),
                            SizedBox(height : 3),
                            Text('2', style: TextStyle(color : Color(0xffb8b8b8),fontSize: 12, fontWeight: FontWeight.w300),),
                          ],
                        ),
                      ),
                      Container(
                        width : 30, height : 40,
                        child: Column(
                          children: [
                            Text('수',style: TextStyle(color : Color(0xff141721),fontSize: 12, fontWeight: FontWeight.w300),),
                            SizedBox(height : 3),
                            Text('3', style: TextStyle(color : Color(0xffb8b8b8),fontSize: 12, fontWeight: FontWeight.w300),),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            day[1] = false;
                            day[0] = false;
                            day[2] = !day[2];
                          });
                        },
                        child: Container(
                          decoration: day[2] ? BoxDecoration(
                            color: Color(0xffebf0ff),
                            borderRadius: BorderRadius.circular(10),
                            border : Border.all(color : Color(0xff4271ff)),
                          ) : null,
                          width : 30, height : 40,
                          child: Column(
                            children: [
                              Text('목',style: TextStyle(color : Color(0xff141721),fontSize: 12, fontWeight: FontWeight.w300),),
                              SizedBox(height : 3),
                              Text('4', style: TextStyle(color : Color(0xff141721),fontSize: 12, fontWeight: FontWeight.w300),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height : 20),
                  Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(height : 42),
                          Container(
                              width : 360, height : 30, decoration : BoxDecoration(borderRadius : BorderRadius.circular(5), color : Color(0xffebf0ff))
                          ),
                        ],
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children : [
                            Container(height : 113, width :106,
                              child: ListWheelScrollView(
                                squeeze : 1,
                                children : s1,
                                itemExtent: 24,
                              ),
                            ),
                            Container(
                              height : 87,
                              child: DottedLine(
                                direction : Axis.vertical,
                              ),
                            ),
                            Container(height : 113, width : 106,
                              child: ListWheelScrollView(
                                squeeze : 2,
                                children : e1,
                                itemExtent: 60,
                              ),
                            ),
                            Container(
                              height : 87,
                              child: DottedLine(
                                direction : Axis.vertical,
                              ),
                            ),
                            Container(height : 113 , width : 106,
                              child: ListWheelScrollView(
                                squeeze : 0.8,
                                children : [Text("AM", style: TextStyle(fontWeight: FontWeight.w300)), Text("PM", style: TextStyle(fontWeight: FontWeight.w300))],
                                itemExtent: 20,
                              ),
                            ),
                          ]


                      ),
                    ],
                  )
                ],
              ),


              Expanded(child : Container()),
              Align(
                alignment: Alignment.bottomCenter,
                child:  GestureDetector(
                  onTap : (){Get.bottomSheet(BottomSheet(inHour));} ,
                  child: Container(
                    width : 324, height : 48,
                    decoration: BoxDecoration(
                      color : Color(0xff4271ff),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child : Center(child : Text("전송하기", style: TextStyle(color : Colors.white, fontSize: 14, fontFamily: 'Apple',fontWeight: FontWeight.w300))),
                  ),
                )
              ),
              SizedBox(height : 18),


            ],
          ),
        )
    );
  }
  Widget BottomSheet(bool hour){
    return Container(
        height : 378,
        width : MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius : BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )
        ),
        child : Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("한동 정신과의원 원내약국 ",style: TextStyle(color : Color(0xff4271ff), fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Gmarket'),),
                    Text("으로",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Gmarket'),),
                  ],
                ),
              ),
              SizedBox(height : 3),
              Text("처방전을 전송하시겠습니까?",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Gmarket'),),
              SizedBox(height :8),
              Divider(),
              SizedBox(height : 8),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  children: [
                    Text("처방전 발급일자",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                    Expanded(child : Container()),
                    Text("${formatDate(DateTime.now(),[yyyy,'.',mm,'.',dd,])}",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  children: [
                    Text("조제기관",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                    Expanded(child : Container()),
                    Text("마음샘정신건강의학과 원내조제",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                  ],
                ),
              ),Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  children: [
                    Text("픽업 예약시간",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                    Expanded(child : Container()),
                    hour? Text("1시간 이내 방문 수령",style: TextStyle(color : Color(0xff4271ff), fontSize: 13, fontWeight: FontWeight.w400,),): Text("2021년 11월 1일 12:00PM",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                  ],
                ),
              ),
              SizedBox(height : 8),
              Divider(),
              SizedBox(height : 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width : 16, height : 16, child : Image.asset('assets/image/Booking/느낌표_빨간색.png'),
                  ),
                  SizedBox(width : 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("약물 픽업 시 유의사항",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w600,),),
                      SizedBox(height : 7),
                      Text("픽업 예약시간을 꼭 지켜주세요",
                        style: TextStyle(color : Color(0xff3d3d3d), fontSize: 11, fontWeight: FontWeight.w400,),),
                      SizedBox(height : 7),
                      Text("픽업 예약시간을 2회 이상 무단으로 어길 시 비대면 진료 서비스\n이용에 제한이 생길 수 있습니다. ",
                        style: TextStyle(color : Color(0xff3d3d3d), fontSize: 11, fontWeight: FontWeight.w400,),),
                    ],
                  )
                ],
              ),
              SizedBox(height : 8),
              Divider(),
              SizedBox(height : 8),
              Row(
                  children : [
                    Container(
                      child : Center(child: Text("취소",style: TextStyle(color : Color(0xff6b6b6b), fontSize: 14, fontWeight: FontWeight.w400,),),),
                      width : 104,
                      height : 48,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color:Color(0xff929292))),
                    ),
                    SizedBox(width : 8),

                    GestureDetector(
                      onTap: (){
                        Get.offAll(homeThirdFinal(),arguments: hour);
                      },
                      child: Container(
                        child : Center(child: Text("확인",style: TextStyle(color : Colors.white, fontSize: 14, fontWeight: FontWeight.w400,),),),
                        width : 188,
                        height : 48,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0xff4271ff)),
                      ),
                    ),
                  ]
              )

            ],
          ),
        )
    );
  }
}

