
import 'package:degree/homeThirdDetail.dart';
import 'package:degree/inCalling.dart';
import 'package:degree/reserveShow.dart';
import 'package:degree/sharedData.dart';
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


class homeThird extends StatefulWidget {
  const homeThird({Key? key}) : super(key: key);

  @override
  _homeThirdState createState() => _homeThirdState();
}


class _homeThirdState extends State<homeThird> {
  final control = Get.put(ReactiveController());
  int idx = 0;
  List<String> _valueList = ['전체기간'];
  var _selected = '전체기간' ;
  List<String> _cateList = ['전체유형'];
  var _selected2 = '전체유형' ;


  @override
  Widget build(BuildContext context) {
    return Container(height : MediaQuery.of(context).size.height,
      child: DefaultTabController(
        length : 3,
        child: Scaffold(
          backgroundColor: Colors.white,
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 29, 18, 18),
                  child: Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap:(){
                            setState(() {
                              if(idx < 2) idx = idx+1;
                              else idx = 0;
                            });
                        },
                          child: Center(child: Text('진료내역',style: TextStyle(color:Colors.black, fontSize:18, fontFamily: 'Gmarket', fontWeight: FontWeight.w500),))),
                      SizedBox(height : 29),
                      Text('예약된 진료', style: TextStyle(color : Color(0xff141922), fontFamily: 'Gmarket', fontWeight: FontWeight.w500, fontSize: 16)),
                      SizedBox(height : 20),
                      control.reserve == false.obs ?  ReservationCard(idx) :
                      Container(width : MediaQuery.of(context).size.width,
                        height : 176, child: Center(child: Text("현재 예약된 진료가 없습니다.", style : TextStyle(color : Color(0xffa0b8ff), fontSize: 13, fontWeight: FontWeight.w400) )),),
                    ],
                  ),
                ),
                Container(width : MediaQuery.of(context).size.width , height : 7, color : Color(0xffebebeb)),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(width : MediaQuery.of(context).size.width),
                      Text('진료 완료 내역', style: TextStyle(color : Color(0xff141922), fontFamily: 'Gmarket', fontWeight: FontWeight.w500, fontSize: 16)),
                      SizedBox(height : 17),
                      Row(
                        children: [
                          DecoratedBox(
                            decoration: ShapeDecoration(
                              color : Color(0xfff3f3f3),
                              shape : RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                            ),
                            child: Container(
                              width : 77,
                              height : 31,
                              child: Center(
                                child: DropdownButton(
                                  underline: SizedBox(),
                                  value : _selected,
                                  items: _valueList.map(
                                        (value){
                                      return DropdownMenuItem(
                                        value : value,
                                        child : Text(value, style : TextStyle(color:Color(0xff929292), fontSize: 12,fontWeight: FontWeight.w400)),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: null,

                                ),
                              ),
                            ),
                          ),
                          SizedBox(width : 6),
                          DecoratedBox(

                            decoration: ShapeDecoration(
                                color : Color(0xfff3f3f3),

                                shape : RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                            child: Container(
                              width : 77,
                              height : 31,
                              child: Center(
                                child: DropdownButton(
                                  underline : SizedBox(),
                                  value : _selected2,
                                  items: _cateList.map(
                                        (value){
                                      return DropdownMenuItem(
                                        value : value,
                                        child : Text(value, style : TextStyle(color:Color(0xff929292), fontSize: 12,fontWeight: FontWeight.w400)),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height : 27),
                      Column1(),
                      Column2(),
                      Column3(),
                      Container(
                        height : 107, width : MediaQuery.of(context).size.width,
                        child: Center(
                          child : Text("더 이상 진료 완료 내역이 없습니다.", style : TextStyle(color : Color(0xff929292), fontSize: 12,))
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }


   Widget ReservationCard(int i){
    return cards[i];
  }



  final cards =[
    Container(
      width: 324, height : 237,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 7, color: Colors.grey.withOpacity(0.5),offset: Offset(0,8), )]),
      child :Padding(
        padding : EdgeInsets.fromLTRB(16, 18, 16, 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(width : 70, height : 22,
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(17.5), border: Border.all(color: Color(0xff929292))),
                  child : Center(child:Text("접수확인중", style : TextStyle(color : Color(0xff929292), fontSize: 12, fontWeight: FontWeight.w300) )),
                ),
                SizedBox(width : 6),
                Container(width : 70, height : 22,
                  decoration: BoxDecoration(
                      color:  Color(0xff6180f1), borderRadius: BorderRadius.circular(17.5), border: Border.all(color: Color(0xff6180f1))),
                  child : Center(child:Text("접수확인중", style : TextStyle(color : Colors.white, fontSize: 12, fontWeight: FontWeight.w300) )),
                ),
              ],
            ),
            SizedBox(height : 13),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("이로사(본인)",style : TextStyle(color : Color(0xff141922), fontSize: 13, fontWeight: FontWeight.w400)),
                    SizedBox(height : 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("김진규 원장",style : TextStyle(color : Color(0xff141922), fontSize: 18, fontWeight: FontWeight.w500)),
                        SizedBox(width : 5),
                        Text("마음샘정신건강의학과",style : TextStyle(color : Color(0xff929292), fontSize: 12, fontWeight: FontWeight.w300)),

                      ],
                    ),
                    SizedBox(height : 7),
                    Text("${DateFormat("yyyy.MM.dd(목) hh:mmaaa").format(DateTime.now()).toString()}", style : TextStyle(color : Color(0xff6b6b6b), fontSize: 13, fontWeight: FontWeight.w400)),
                  ],
                ),
                Expanded(child: Container()),
                SizedBox(height : 67, width : 67, child : Image.asset("assets/image/Detail/circular1.png"))
              ],
            ),
            SizedBox(height :14),
            SizedBox(height : 35, width : 292, child : Image.asset("assets/image/Detail/rect1.png")),
            SizedBox(height : 13),
            Container(width : 292, decoration: BoxDecoration(border : Border.all(color : Color(0xffdadada), width : 0.35)),),
            Row(
              children: [
                Container(
                    width : 144,height : 37,
                    child : Center(child: Text("예약 취소", style : TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400)))
                ),
                Container(height : 37, decoration: BoxDecoration(border : Border.all(color : Color(0xffdadada), width : 0.35)),),
                Container(
                    width : 144,height : 37,
                    child : Center(child: Text("예약내역 확인", style : TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400)))
                ),
              ],
            )

          ],
        ),
      ),
    ),
    Container(
      width: 324, height : 237,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border : Border.all(color : Color(0xff6180f1)),
          boxShadow: [BoxShadow(blurRadius: 7, color: Colors.grey.withOpacity(0.5),offset: Offset(0,8), )]),
      child :Padding(
        padding : EdgeInsets.fromLTRB(16, 18, 16, 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(width : 70, height : 22,
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(17.5), border: Border.all(color: Color(0xffff5b64))),
                  child : Center(child:Text("D-2", style : TextStyle(color: Color(0xffff5b64), fontSize: 12, fontWeight: FontWeight.w300) )),
                ),
                SizedBox(width : 6),
                Container(width : 70, height : 22,
                  decoration: BoxDecoration(
                      color:  Color(0xff6180f1), borderRadius: BorderRadius.circular(17.5), border: Border.all(color: Color(0xff6180f1))),
                  child : Center(child:Text("전화진료", style : TextStyle(color : Colors.white, fontSize: 12, fontWeight: FontWeight.w300) )),
                ),
              ],
            ),
            SizedBox(height : 13),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("이로사(본인)",style : TextStyle(color : Color(0xff141922), fontSize: 13, fontWeight: FontWeight.w400)),
                    SizedBox(height : 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("김진규 원장",style : TextStyle(color : Color(0xff141922), fontSize: 18, fontWeight: FontWeight.w500)),
                        SizedBox(width : 5),
                        Text("마음샘정신건강의학과",style : TextStyle(color : Color(0xff929292), fontSize: 12, fontWeight: FontWeight.w300)),

                      ],
                    ),
                    SizedBox(height : 7),
                    Text("${DateFormat("yyyy.MM.dd(목) hh:mmaaa").format(DateTime.now()).toString()}", style : TextStyle(color : Color(0xff6b6b6b), fontSize: 13, fontWeight: FontWeight.w400)),
                  ],
                ),
                Expanded(child: Container()),
                GestureDetector(
                    onTap: (){
                      Get.to(()=>sharedData());
                    },
                    child: SizedBox(height : 67, width : 67, child : Image.asset("assets/image/Detail/circular2.png")))
              ],
            ),
            SizedBox(height :14),
            SizedBox(height : 35, width : 292, child : Image.asset("assets/image/Detail/rect2.png")),
            SizedBox(height : 13),
            Container(width : 292, decoration: BoxDecoration(border : Border.all(color : Color(0xffdadada), width : 0.35)),),
            Row(
              children: [
                Container(
                    width : 144,height : 37,
                    child : Center(child: Text("예약 취소", style : TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400)))
                ),
                Container(height : 37, decoration: BoxDecoration(border : Border.all(color : Color(0xffdadada), width : 0.35)),),
                GestureDetector(
                  onTap:(){
                    Get.to(()=>reserveShow());
                  },
                  child: Container(
                      width : 144,height : 37,
                      child : Center(child: Text("예약내역 확인", style : TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400)))
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    ),
    Container(
      width: 324, height : 237,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border : Border.all(color : Color(0xffff5b64)),
          boxShadow: [BoxShadow(blurRadius: 7, color: Colors.grey.withOpacity(0.5),offset: Offset(0,8), )]),
      child :Padding(
        padding : EdgeInsets.fromLTRB(16, 18, 16, 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(width : 70, height : 22,
                  decoration: BoxDecoration(
                      color: Color(0xffff5b64), borderRadius: BorderRadius.circular(17.5), border: Border.all(color: Color(0xffff5b64))),
                  child : Center(child:Text("On-Time", style : TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300) )),
                ),
                SizedBox(width : 6),
                Container(width : 70, height : 22,
                  decoration: BoxDecoration(
                      color:  Color(0xff6180f1), borderRadius: BorderRadius.circular(17.5), border: Border.all(color: Color(0xff6180f1))),
                  child : Center(child:Text("전화진료", style : TextStyle(color : Colors.white, fontSize: 12, fontWeight: FontWeight.w300) )),
                ),
              ],
            ),
            SizedBox(height : 13),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("이로사(본인)",style : TextStyle(color : Color(0xff141922), fontSize: 13, fontWeight: FontWeight.w400)),
                    SizedBox(height : 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("김진규 원장",style : TextStyle(color : Color(0xff141922), fontSize: 18, fontWeight: FontWeight.w500)),
                        SizedBox(width : 5),
                        Text("마음샘정신건강의학과",style : TextStyle(color : Color(0xff929292), fontSize: 12, fontWeight: FontWeight.w300)),

                      ],
                    ),
                    SizedBox(height : 7),
                    Text("${DateFormat("yyyy.MM.dd(목) hh:mmaaa").format(DateTime.now()).toString()}", style : TextStyle(color : Color(0xff6b6b6b), fontSize: 13, fontWeight: FontWeight.w400)),
                  ],
                ),
                Expanded(child: Container()),
                GestureDetector(
                    onTap: (){
                      Get.to(()=>sharedData());
                    },
                    child: Container(height : 67, width : 67, child : Image.asset("assets/image/Detail/circular2.png")))
              ],
            ),
            SizedBox(height :14),
            GestureDetector(
              onTap:(){
                Get.offAll(()=>inCalling());
              },
                child: SizedBox(height : 35, width : 292, child : Image.asset("assets/image/Detail/rect2.png"))),
            SizedBox(height : 13),
            Container(width : 292, decoration: BoxDecoration(border : Border.all(color : Color(0xffdadada), width : 0.35)),),
            Row(
              children: [
                Container(
                    width : 144,height : 37,
                    child : Center(child: Text("예약 취소", style : TextStyle(color : Color(0xffb8b8b8), fontSize: 13, fontWeight: FontWeight.w400)))
                ),
                Container(height : 37, decoration: BoxDecoration(border : Border.all(color : Color(0xffdadada), width : 0.35)),),
                GestureDetector(
                  onTap:(){
                    Get.to(()=>reserveShow());
                  },
                  child: Container(
                      width : 144,height : 37,
                      child : Center(child: Text("예약내역 확인", style : TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400)))
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    ),


  ];



  Widget Column1(){
    var yearDate = DateFormat("yyyy.MM.dd(목) hh:mmaaa").format(DateTime.now()).toString();
    var date = DateFormat("MM.dd(목)").format(DateTime.now()).toString();
    var pickup = true;
    var argument = [yearDate, date, pickup];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width : 70, height : 22,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(17.5), border: Border.all(color: Color(0xff6691ff))),
          child : Center(child:Text("AI진료", style : TextStyle(color : Color(0xffa0b8ff), fontSize: 13, fontWeight: FontWeight.w300) )),
        ),
        SizedBox(height : 13),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("이로사(본인)", style : TextStyle(color : Color(0xff141922), fontSize: 13, fontWeight: FontWeight.w400)),
                SizedBox(height : 5),
                Text("AI 진료", style : TextStyle(color : Color(0xff141922), fontSize: 18, fontWeight: FontWeight.w500)),
                SizedBox(height : 7),
                Text("${DateFormat("yyyy.MM.dd(목) hh:mmaaa").format(DateTime.now()).toString()}", style : TextStyle(color : Color(0xff6b6b6b), fontSize: 13, fontWeight: FontWeight.w400)),
              ],
            ),
            Expanded(child: Container()),
            Container(
              width : 95, height : 55,
              decoration: BoxDecoration(
                color: Color(0xfffff5f5), borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("약물 픽업 완료", style : TextStyle(color : Color(0xfff37981), fontSize: 11, fontWeight: FontWeight.w500)),
                  SizedBox(height : 4),
                  Text("${DateFormat("MM.dd(목)").format(DateTime.now()).toString()}", style : TextStyle(color : Color(0xfff37981), fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              ),
            )
          ],
        ),
        SizedBox(height : 12),
        GestureDetector(
          onTap: (){
            Get.to(()=>homeThirdDetail(), arguments : argument);
          },
          child: Row(
            children: [
              Expanded(child: Container()),
              Text("진료 내역 상세 보기", style : TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400)),
              SizedBox(width : 6),
              Icon(Icons.arrow_forward_ios, size: 11,)
            ],
          ),
        ),
        SizedBox(height : 21),
        Divider(thickness: 0.7,),
      ],
    );
  }

  Widget Column2(){
    var yearDate = DateFormat("yyyy.MM.dd(목) hh:mmaaa").format(DateTime.now()).toString();
    var date = DateFormat("MM.dd(목)").format(DateTime.now()).toString();
    var pickup = true;
    var argument = [yearDate, date, pickup];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height : 20),
        Container(width : 70, height : 22,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(17.5), border: Border.all(color: Color(0xff6691ff))),
          child : Center(child:Text("전화진료", style : TextStyle(color : Color(0xffa0b8ff), fontSize: 13, fontWeight: FontWeight.w300) )),
        ),
        SizedBox(height : 13),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("이로사(본인)", style : TextStyle(color : Color(0xff141922), fontSize: 13, fontWeight: FontWeight.w400)),
                SizedBox(height : 5),
                Row(
                  children: [
                    Text("김준상 의사", style : TextStyle(color : Color(0xff141922), fontSize: 18, fontWeight: FontWeight.w500)),
                    SizedBox(width : 3),
                    Text('한동 정신과의원', style : TextStyle(color : Color(0xff929292), fontSize: 14, fontWeight: FontWeight.w300))
                  ],
                ),
                SizedBox(height : 7),
                Text("${DateFormat("yyyy.MM.dd(목) hh:mmaaa").format(DateTime.now()).toString()}", style : TextStyle(color : Color(0xff6b6b6b), fontSize: 13, fontWeight: FontWeight.w300)),
              ],
            ),
            Expanded(child: Container()),
            Container(
              width : 95, height : 55,
              decoration: BoxDecoration(
                color: Color(0xfffff5f5), borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("약물 픽업 완료", style : TextStyle(color : Color(0xfff37981), fontSize: 11, fontWeight: FontWeight.w500)),
                  SizedBox(height : 4),
                  Text("${DateFormat("MM.dd(목)").format(DateTime.now()).toString()}", style : TextStyle(color : Color(0xfff37981), fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              ),
            )
          ],
        ),
        SizedBox(height : 12),
        GestureDetector(
          onTap: (){
            Get.to(()=>homeThirdDetail(),arguments : argument);
          },
          child: Row(
            children: [
              Expanded(child: Container()),
              Text("진료 내역 상세 보기", style : TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400)),
              SizedBox(width : 6),
              Icon(Icons.arrow_forward_ios, size: 11,)
            ],
          ),
        ),
        SizedBox(height : 21),
        Divider(thickness: 0.7,),
      ],
    );
  }
  Widget Column3(){
    var yearDate = DateFormat("yyyy.MM.dd(목) hh:mmaaa").format(DateTime.now()).toString();
    var date = DateFormat("MM.dd(목)").format(DateTime.now()).toString();
    var pickup = true;
    var argument = [yearDate, date, pickup];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height : 20),
        Container(width : 70, height : 22,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(17.5), border: Border.all(color: Color(0xff6691ff))),
          child : Center(child:Text("화상진료", style : TextStyle(color : Color(0xffa0b8ff), fontSize: 13, fontWeight: FontWeight.w300) )),
        ),
        SizedBox(height : 13),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("이로사(본인)", style : TextStyle(color : Color(0xff141922), fontSize: 13, fontWeight: FontWeight.w400)),
                SizedBox(height : 5),
                Row(
                  children: [
                    Text("김준상 의사", style : TextStyle(color : Color(0xff141922), fontSize: 18, fontWeight: FontWeight.w500)),
                    SizedBox(width : 3),
                    Text('한동 정신과의원', style : TextStyle(color : Color(0xff929292), fontSize: 14, fontWeight: FontWeight.w400))
                  ],
                ),
                SizedBox(height : 7),
                Text("${DateFormat("yyyy.MM.dd(목) hh:mmaaa").format(DateTime.now()).toString()}", style : TextStyle(color : Color(0xff6b6b6b), fontSize: 13, fontWeight: FontWeight.w300)),
              ],
            ),
            Expanded(child: Container()),
            Container(
              width : 95, height : 55,
              decoration: BoxDecoration(
                color: Color(0xfffff5f5), borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("약물 픽업 완료", style : TextStyle(color : Color(0xfff37981), fontSize: 11, fontWeight: FontWeight.w500)),
                  SizedBox(height : 4),
                  Text("${DateFormat("MM.dd(목)").format(DateTime.now()).toString()}", style : TextStyle(color : Color(0xfff37981), fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              ),
            )
          ],
        ),
        SizedBox(height : 12),
        GestureDetector(
          onTap: (){
            Get.to(()=>homeThirdDetail(),arguments : argument);
          },
          child: Row(
            children: [
              Expanded(child: Container()),
              Text("진료 내역 상세 보기", style : TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400)),
              SizedBox(width : 6),
              Icon(Icons.arrow_forward_ios, size: 11,)
            ],
          ),
        ),
        SizedBox(height : 21),
        Divider(thickness: 0.7,),
      ],
    );
  }

  static Widget Dialog(){
    return Stack(
        children: [
          Center(
              child: Container(
                height : 204,
                width: 290,
                child: Image.asset("assets/image/home/예약취소팝업.png"),
              )
          ),


        ]
    );
  }


}

