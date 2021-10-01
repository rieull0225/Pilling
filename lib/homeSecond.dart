import 'package:degree/drug1.dart';
import 'package:degree/drug2.dart';
import 'package:degree/drugFail.dart';
import 'package:degree/drugOK.dart';
import 'package:degree/sideEffect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:get/get.dart';
import 'homeFirst.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

String dateFormat = DateFormat('EEEE').format(DateTime.now());
bool isSet = false;
bool prep = true;
bool side = true;

class homeSecond extends StatefulWidget {
  const homeSecond({Key? key}) : super(key: key);


  @override
  _homeSecondState createState() => _homeSecondState();
}
class _homeSecondState extends State<homeSecond> {
  var info = false;


  @override
  Widget build(BuildContext context) {
    return Container(height : MediaQuery.of(context).size.height,
      child: DefaultTabController(
        length : 3,
        child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            titleSpacing: 0,
            title : Text('필잉스토리',style: TextStyle(color:Colors.black, fontSize:18, fontFamily: 'Gmarket', fontWeight: FontWeight.w700),),
            elevation: 2,
            backgroundColor: Colors.white,
            bottom : TabBar(
              labelPadding: EdgeInsets.symmetric(horizontal:15),
                indicatorPadding: EdgeInsets.symmetric(horizontal:15),
              indicatorColor: Color(0xff4271ff),
              labelColor: Color(0xff4271ff),
              unselectedLabelColor: Color(0xff929292),
              tabs : [
                Tab(child : Text("나의 약통", style : TextStyle(fontSize: 15, fontFamily: 'Gmarket'))),
                Tab(child : Text("캘린더", style : TextStyle(fontSize: 15, fontFamily: 'Gmarket'))),
                Tab(child : Text("부작용리포트", style : TextStyle(fontSize: 15, fontFamily: 'Gmarket'))),
              ]
            )
          ),
          body: TabBarView(
            children: [
              Tab1(),
              Tab2(),
              Tab3(),

            ],
          )
        ),
      ),
    );}

    Widget Tab1(){
      return ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(height : 326,
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height : 29),
                          Text("약통이 새로 채워진지",style: TextStyle(color: Color(0xff141922), fontSize: 16, fontFamily: 'Gmarket',fontWeight: FontWeight.w500),),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("D+12",style: TextStyle(color: Color(0xff4271ff),fontSize: 36, fontFamily: 'Gmarket',fontWeight: FontWeight.w500),),

                              GestureDetector(
                                onTap:(){
                                  setState(() {
                                    info = !info;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(6.0,0,6,4),
                                  child: SizedBox(width : 18, height : 18, child : Image.asset("assets/image/home/Info_light.png")),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height : 19),
                          Row(
                            children: [
                              GestureDetector(
                                onTap:(){
                                  Get.to(drug1());
                                },
                                child: Container(
                                    width : 155, height : 171,
                                    decoration:BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color:Color(0xfff7a0a6)),
                                      color: Colors.white,
                                      boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.withOpacity(0.3)),],
                                    )
                                    ,child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox( width : 40, height : 45,child: Image.asset('assets/image/home/image1.png'),),
                                        SizedBox(height : 18),
                                        Text("콘서타OROS서방정\n27mg",style: TextStyle(color:Color(0xff141922,), fontSize: 14, ),textAlign: TextAlign.center,),
                                        SizedBox(height : 14),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("자세히 보기",style: TextStyle(color : Color(0xff4271ff), fontSize: 11,),),
                                            Icon(Icons.arrow_forward_ios, size: 11, color: Color(0xff4271ff),),
                                          ],
                                        )

                                  ],
                                )),
                              ),
                              SizedBox(width : 13),
                              GestureDetector(
                                onTap: (){
                                  Get.to(drug2());
                                },
                                child: Container(width : 155, height : 171,
                                    decoration:BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.withOpacity(0.3)),],
                                    )
                                    ,child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox( width : 40, height : 45,child: Image.asset('assets/image/home/image2.png'),),
                                        SizedBox(height : 18),
                                        Text("아빌리파이정2mg\n",style: TextStyle(color:Color(0xff141922,), fontSize: 14, ),textAlign: TextAlign.center,),
                                        SizedBox(height : 14),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("자세히 보기",style: TextStyle(color : Color(0xff4271ff), fontSize: 11,),),
                                            Icon(Icons.arrow_forward_ios, size: 11, color: Color(0xff4271ff),),
                                          ],
                                        )

                                      ],
                                    )),
                              ),

                            ],
                          )

                        ],
                      ),
                    )

                  ),
                  info ? Padding(
                    padding: const EdgeInsets.fromLTRB(25,80,0,0),
                    child: Stack(
                      children: [
                        Image.asset('assets/image/home/Union.png'),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24,24,0,0),
                          child: Text('비대면 진료시 발급된 처방전을 기준으로 복약 정보가\n자동 업데이트돼요! (최근 업데이트 2021.07.08)',style: TextStyle(fontSize: 11,color: Color(0xff6d6d6d)),),
                        )
                      ],
                    ),
                  ): Container(),

                ],
              ),
              Container(height : 6, decoration: BoxDecoration(color : Color(0xfff4f4f4)),),
              Container(height : 470,
              decoration: BoxDecoration(color: Colors.white),
              child:
              Padding(
                padding: const EdgeInsets.fromLTRB(18,20,18,20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('지난 복용 이력 한눈에 보기',style: TextStyle(fontSize: 16, fontFamily: 'Gmarket',fontWeight: FontWeight.w500),),
                    SizedBox(height : 10),
                    Image.asset("assets/image/home/Graph.png"),
                    SizedBox(height : 18),
                    Center(child: Container(width : 219, height : 18,child: Image.asset("assets/image/home/nameTag.png")))
                  ],
                ),
              )),
            ],
          )
        ],
      );
    }
  Widget Tab2(){
    return ListView(
      children: [
        Column(
          children: [

          ],
        )
      ],
    );
  }
  Widget Tab3(){
    return ListView(
      children: [
        Column(
          children: [

          ],
        )
      ],
    );
  }
}

