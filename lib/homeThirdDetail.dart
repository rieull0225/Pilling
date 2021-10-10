
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'assets.dart';
import 'package:date_format/date_format.dart';

String dateFormat = DateFormat('EEEE').format(DateTime.now());
bool isSet = false;
bool prep = true;
bool side = true;


class homeThirdDetail extends StatefulWidget {
  const homeThirdDetail({Key? key}) : super(key: key);

  @override
  _homeThirdDetailState createState() => _homeThirdDetailState();
}

class _homeThirdDetailState extends State<homeThirdDetail> {
  static var argument = Get.arguments;
  var YearDate = argument[0];
  var date = argument[1];
  var pickup = argument[2];

  final control = Get.put(ReactiveController());
  int idx = 0;
  List<String> _valueList = ['전체기간'];
  var _selected = '전체기간' ;
  List<String> _cateList = ['전체유형'];
  var _selected2 = '전체유형' ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.arrow_back_ios,),onPressed: (){Get.back();},color: Colors.white,)],
        title : Center(child : Text('진료내역 상세', style: TextStyle(color : Color(0xff141922), fontSize: 14 ),)),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Color(0xff141922),
          icon: Icon(Icons.arrow_back_ios, size: 20),
          onPressed: (){Get.back();},
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(17,24,17,30),
                child: Container(
                  width : MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("진료완료", style: TextStyle(color : Color(0xff141922),fontFamily: 'Gmarket', fontSize: 18 ,fontWeight: FontWeight.w500),),
                      SizedBox(height : 29),
                      Text("진료 정보", style: TextStyle(color : Color(0xff141922),fontFamily: 'Gmarket', fontSize: 15 ,fontWeight: FontWeight.w500),),
                      Column(
                        children: [
                          SizedBox(height : 13),
                          Row(
                            children: [
                              SizedBox(height : 43, width : 43, child : Image.asset("assets/image/마음샘정신건강의학과/김진규 원장.png")),
                              SizedBox(width : 9),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("마음샘정신건강의학과", style: TextStyle( color : Color(0xff3d3d3d), fontSize: 11, fontWeight: FontWeight.w500),),
                                  Text("김진규 원장", style: TextStyle( color : Color(0xff141922), fontSize: 15,  fontWeight: FontWeight.w600),)
                                ],
                              ),
                              Expanded(child : Container()),
                              SizedBox(width : 70, height : 22 ,  child : Image.asset('assets/image/Booking/전화진료.png')),
                            ],
                          ),
                          SizedBox(height : 12),
                          Divider(thickness: 0.5,),
                          SizedBox(height : 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    children: [
                                      Text("환자명",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                                      Expanded(child : Container()),
                                      Text("이로사",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    children: [
                                      Text("접수일",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                                      Expanded(child : Container()),
                                      Text(YearDate,style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    children: [
                                      Text("예약 시간",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                                      Expanded(child : Container()),
                                      Text(date,style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    children: [
                                      Text("약물 조절 요청사항",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                                      Expanded(child : Container()),
                                      Text("증량하고 싶어요",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                                    ],
                                  ),
                                ),


                                Divider(),
                                SizedBox(height : 12),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 3),
                                        child: Row(
                                          children: [
                                            Text("진료일시",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                                            Expanded(child : Container()),
                                            Text(YearDate ,style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 3),
                                        child: Row(
                                          children: [
                                            Text("처방전 발급여부",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                                            Expanded(child : Container()),
                                            Text("발급",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 3),
                                        child: Row(
                                          children: [
                                            Text("약물 픽업 예약",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),

                                            Expanded(child : Container()),
                                            pickup? Text("1시간 이내 방문 수령",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),) :
                                            Text("예약 대기 중중",style: TextStyle(color : Color(0xff5b64), fontSize: 13, fontWeight: FontWeight.w400,),),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 3),
                                        child: Row(
                                          children: [
                                            Text("약물 조절 요청사항",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                                            Expanded(child : Container()),
                                            Text("증량하고 싶어요",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                                          ],
                                        ),
                                      ),



                                    ],
                            ),
                          )


                        ],
                      ),
                            ),

                        ],
                  ),
                ]),
              )

              ),
              Container(
                width : MediaQuery.of(context).size.width,
                height : 7,
                decoration: BoxDecoration(color : Color(0xfffafafa)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18,20,18,30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("처방전", style: TextStyle(color : Color(0xff141922),fontFamily: 'Gmarket', fontSize: 18 ,fontWeight: FontWeight.w500),),
                      SizedBox(height : 13),

                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("환자 보관용", style: TextStyle(color : Color(0xff3d3d3d), fontSize: 12 ,fontWeight: FontWeight.w400),),
                                  Text("모바일처방전", style: TextStyle( color : Color(0xff141922), fontSize: 16, fontWeight: FontWeight.w700),),
                                  Text("발급일자 "+YearDate, style: TextStyle( color : Color(0xff6b6b6b), fontSize: 12,  fontWeight: FontWeight.w400),)
                                ],
                              ),
                              Expanded(child : Container()),
                              SizedBox(width : 60, height : 60 ,  child : Image.asset('assets/image/Detail/실제처방전보기.png')),
                            ],
                          ),
                          SizedBox(height : 12),
                          Divider(thickness: 0.5,),
                          SizedBox(height : 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    children: [
                                      Text("병원명",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                                      Expanded(child : Container()),
                                      Text("한동 정신과의원",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    children: [
                                      Text("의사명",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                                      Expanded(child : Container()),
                                      Text("김준상 의사",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    children: [
                                      Text("환자명",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                                      Expanded(child : Container()),
                                      Text("이로사",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    children: [
                                      Text("복용 횟수",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                                      Expanded(child : Container()),
                                      Text("1일 1회/14일",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                                    ],
                                  ),
                                ),


                                Divider(),
                                SizedBox(height : 12),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 3),
                                        child: Row(
                                          children: [
                                            Text("콘서타OROS서방정 36mg",style: TextStyle(color : Color(0xff141922), fontSize: 13, fontWeight: FontWeight.w600,),),
                                            Expanded(child : Container()),
                                            Text("1정  /  1회" ,style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 3),
                                        child: Row(
                                          children: [
                                            Text("아빌리파이정 2mg",style: TextStyle(color : Color(0xff141922), fontSize: 13, fontWeight: FontWeight.w600,),),
                                            Expanded(child : Container()),
                                            Text("1정  /  1회" ,style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                )


                              ],
                            ),
                          ),


                        ],
                      ),
                    ]
                ),

              ),
              Container(
                width : MediaQuery.of(context).size.width,
                height : 7,
                decoration: BoxDecoration(color : Color(0xfffafafa)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18,20,18,30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("결제 정보", style: TextStyle(color : Color(0xff141922),fontFamily: 'Gmarket', fontSize: 18 ,fontWeight: FontWeight.w500),),
                      SizedBox(height : 13),

                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    children: [
                                      Text("진료비",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                                      Expanded(child : Container()),
                                      Text("8,000원",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    children: [
                                      Text("결제수단",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                                      Expanded(child : Container()),
                                      Text("카카오페이",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),


                        ],
                      ),
                    ]
                ),

              ),
            ],
          )
        ],
      ),
    );
  }



}

