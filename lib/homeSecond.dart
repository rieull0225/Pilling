import 'package:degree/drug1.dart';
import 'package:degree/drug2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
  var info2 = false;
  List _valueList = ['06월27일 - 07월03일','07월04일 - 07월11일'];
  var _selected = '06월27일 - 07월03일' ;


  @override
  Widget build(BuildContext context) {
    return Container(height : MediaQuery.of(context).size.height,
      child: DefaultTabController(
        length : 3,
        child: Scaffold(
          appBar: AppBar(
              actions: [IconButton(icon: Icon(Icons.arrow_back_ios,),onPressed: (){Get.back();},color: Colors.white,)],
            leading: Container(),
            titleSpacing: 0,
            title : Padding(
              padding: const EdgeInsets.only(top : 20.0),
              child: Center(child: Text('필잉스토리',style: TextStyle(color:Colors.black, fontSize:18, fontFamily: 'Gmarket', fontWeight: FontWeight.w500),)),
            ),
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
    return Container(
      decoration: BoxDecoration(color : Colors.white),
      child: ListView(
        children: [
          Column(
            children: [
              SizedBox(height : 16,),
              Stack(
                children: [
                  Container(
                    width : MediaQuery.of(context).size.width,
                    height : MediaQuery.of(context).size.width,
                    child:Image.asset('assets/image/home/calender.png'),

                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(259, 18, 0, 0),
                    child: GestureDetector(
                      onTap: (){
                        Get.dialog(
                          Dialog()
                        );
                      },
                        child: SizedBox(width : 68, height : 22, child: Image.asset("assets/image/home/복용률.png"),)),
                  )
                ],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 31.0),
                child: Column(
                  children: [
                    SizedBox(
                      width : MediaQuery.of(context).size.width, height : 47,
                      child: Image.asset('assets/image/home/캘린더기록.png'),
                    ),
                    SizedBox(
                      width : MediaQuery.of(context).size.width, height : 63,
                      child: Image.asset('assets/image/home/캘린더기록-1.png'),
                    ),SizedBox(
                      width : MediaQuery.of(context).size.width, height : 63,
                      child: Image.asset('assets/image/home/캘린더기록-2.png'),
                    ),
                    SizedBox(height: 109),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }


  Widget Dialog(){
    return Stack(
      children: [
        Center(
          child: Container(
            height : 384,
            width: 294,
            child: Image.asset("assets/image/home/복용률팝업.png"),


          )
        ),

        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height : 336,
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


  Widget Tab3(){
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      width : MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18,28,0,28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    DropdownButton(
                      value : _selected,
                      items: _valueList.map(
                            (value){
                          return DropdownMenuItem(
                            value : value,
                            child : Text(value, style : TextStyle(color:Color(0xff4271ff),fontFamily: 'Gmarket', fontSize: 16,fontWeight: FontWeight.w400)),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState((){
                          _selected = value.toString();
                        });
                      },
                    ),
                    SizedBox(width : 7),
                    Text("동안",style : TextStyle(color:Color(0xff141922),fontFamily: 'Gmarket', fontSize: 16,fontWeight: FontWeight.w400)),
                  ],
                ),
                Text("콘서타OROS 27mg과 아빌리파이 2mg\n"
                "복용 중 나타난 부작용이에요.",style : TextStyle(color:Color(0xff141922),fontFamily: 'Gmarket', fontSize: 16,fontWeight: FontWeight.w400)),
                SizedBox(height : 27),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(color:Colors.grey.withOpacity(0.5), offset : Offset(2,2), blurRadius: 10)]
                      ),
                      width : 324, height : 399,
                      child : Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("부작용의 종류와 빈도는",style : TextStyle(color:Color(0xff141922),fontFamily: 'Gmarket', fontSize: 16,fontWeight: FontWeight.w500)),
                                Row(
                                  children: [
                                    Text("적정상태",style : TextStyle(color:Color(0xff4271ff),fontFamily: 'Gmarket', fontSize: 16,fontWeight: FontWeight.w500)),
                                    Text(" 입니다.",style : TextStyle(color:Color(0xff141922),fontFamily: 'Gmarket', fontSize: 16,fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                SizedBox(height : 30),
                                Image.asset("assets/image/home/sideInfo.png"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(290.0, 23,0,0),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  info2 = !info2;
                                });
                              },
                              child: SizedBox(
                                height : 17,
                                width : 17,
                                child: Image.asset('assets/image/home/Info_light.png'),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    info2 ? Padding(
                      padding: const EdgeInsets.fromLTRB(80,36,0,0),
                      child: SizedBox(
                          width : 300,child: Image.asset('assets/image/home/talkbubble.png')),
                    ): Container(),
                  ],
                ),
                SizedBox(height : 20),
                Container(
                  width : 324,
                  height : 501,
                  decoration: BoxDecoration(
                      color: Color(0xfff8faff),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color:Colors.grey.withOpacity(0.5), offset : Offset(2,2), blurRadius: 10)]
                  ),
                  child : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text("각 부작용에 대해\n이렇게 느꼈다고 답했어요.",
                            style : TextStyle(color:Color(0xff141922),fontFamily: 'Gmarket', fontSize: 16,fontWeight: FontWeight.w500)),
                        SizedBox(height : 22),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset("assets/image/home/sideGraph.png"),
                        ),
                        SizedBox(height: 100, width : 286, child : Image.asset("assets/image/home/sideWarning.png")),
                      ]
                    ),
                  )
                ),
                SizedBox(height : 20),
                Container(
                    width : 324,
                    height : 452,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(color:Colors.grey.withOpacity(0.5), offset : Offset(2,2), blurRadius: 10)]
                    ),
                    child :  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("부작용이 가장 활발한 시간대는",style : TextStyle(color:Color(0xff141922),fontFamily: 'Gmarket', fontSize: 16,fontWeight: FontWeight.w500)),
                          Row(
                            children: [
                              Text("17시 ~ 19시",style : TextStyle(color:Color(0xff4271ff),fontFamily: 'Gmarket', fontSize: 16,fontWeight: FontWeight.w500)),
                              Text(" 입니다.",style : TextStyle(color:Color(0xff141922),fontFamily: 'Gmarket', fontSize: 16,fontWeight: FontWeight.w500)),

                            ],
                          ),
                          SizedBox(height : 30),
                          SizedBox(
                              width : 286, height : 324, child : Image.asset('assets/image/home/sideTimeGraph.png')
                          )
                        ],
                      ),
                    ),
                ),
                SizedBox(height : 85),


              ],
            ),
          )

        ],
      ),
    );
  }
}

