
import 'package:degree/home.dart';
import 'package:degree/homeThird.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'assets.dart';
import 'package:date_format/date_format.dart';


class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  _paymentState createState() => _paymentState();
}


class Buttons{
  String label;
  int idx;
  var arrow;
  Buttons({required this.label, required this.idx, this.arrow});
}

List<bool> boolList = [for(int i = 0 ; i < buttonList.length ; i++) false];

List<Buttons> buttonList = [
  Buttons(label : "카카오페이", idx : 0, arrow : false),
  Buttons(label: "카드결제", idx : 1 , arrow : true),
  Buttons(label: "기타 결제", idx : 2, arrow : true),
];


class _paymentState extends State<payment> {

  bool isSet = false;
  String request = '';

  bool total = true;
  bool isChecked = false;
  List<bool> bList = [true,true,true];
  List<String> strList = [
    '전자금융거래 기본약관 (필수)',
    '개인정보 수집 및 이용 동의 (필수)',
    '개인정보 제공 및 위탁 동의 (필수)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.arrow_back_ios,),onPressed: (){Get.back();},color: Colors.white,)],
        title : Center(child : Text('진료비 결제', style: TextStyle(color : Color(0xff141922), fontSize: 14 ),)),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Color(0xff141922),
          icon: Icon(Icons.arrow_back_ios, size: 20),
          onPressed: (){Get.back();},
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18,20,18,30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("진료비", style: TextStyle(color : Color(0xff141922),fontFamily: 'Gmarket', fontSize: 18 ,fontWeight: FontWeight.w500),),
                  SizedBox(height : 13),

                  Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("결제 금액",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                              Expanded(child : Container()),
                              Text("8,000",style: TextStyle(color : Color(0xff4271ff), fontSize: 29, fontWeight: FontWeight.w300,),),
                              Text("원",style: TextStyle(color : Color(0xff141922), fontSize: 29, fontWeight: FontWeight.w300,),),
                            ],
                          ),
                        ],
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
                Text("결제 수단을 선택해주세요.", style: TextStyle(color : Color(0xff141922),fontFamily: 'Gmarket', fontSize: 18 ,fontWeight: FontWeight.w500),),
                SizedBox(height : 22),
                for(int i = 0 ; i < buttonList.length ; i++)
                  Buttons(buttonList[i].label, i, buttonList[i].arrow),
                SizedBox(height : 15),
                Agreement(),
                SizedBox(height : 14),
                GestureDetector(
                  onTap: (){
                    Get.dialog(Dialog());
                  },
                  child: Container(
                    width : 324, height : 48,
                    decoration: BoxDecoration(color : Color(0xff4271ff), borderRadius: BorderRadius.circular(12)),
                    child: Center(child  : Text("결제하기", style : TextStyle(color : Colors.white, fontSize: 14,))),
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }

  Widget Buttons(String label, int idx, var arrow){
    return Padding(
        padding : EdgeInsets.symmetric(vertical: 4.5),
        child : boolList[idx] ? GestureDetector(
          onTap : (){
            setState(() {
              boolList[idx] = false;
              isSet= false;
            });
          },
          child: Container(
              width :324, height : 48,
              decoration: BoxDecoration(color : Color(0xffebf0ff), border: Border.all(color : Color(0xff4271ff),), borderRadius: BorderRadius.circular(5)),
              child : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Row(
                  children: [
                    Center(child: Text(label, style: TextStyle(fontSize: 13, color: Color(0xff6b6b6b)),)),
                    Expanded(child: Container()),
                    if(arrow == true) Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              )
          ),
        ) : GestureDetector(
          onTap : (){
            setState(() {
              for(int i = 0 ; i < buttonList.length ; i++)
                boolList[i] = false;
              boolList[idx] = true;
              isSet = true;
              request = buttonList[idx].label;
            });
          },
          child: Container(
              width :324, height : 48,
              decoration: BoxDecoration(color : Colors.white, border: Border.all(color : Color(0xffdadada),), borderRadius: BorderRadius.circular(5)),
              child : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Row(
                  children: [
                    Center(child:  Text(label, style: TextStyle(fontSize: 13, color: Color(0xff6b6b6b)),)),
                    Expanded(child: Container()),
                    if(arrow == true) Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              )
          ),
        )
    );
  }

  Widget Agreement(){
    return Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StatefulBuilder(builder : (BuildContext context, StateSetter setState){
                return Column(
                    children :[
                      SizedBox(height : 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: (){
                                setState((){
                                  total = total ? false : true;
                                  for(int i = 0; i < bList.length ; ++i){
                                    bList[i] = total ? true : false;
                                  }
                                });
                              },
                              child:total ? Icon(Icons.check_circle_rounded,size : 18, color: Color(0xffb8b8b8)):Icon(Icons.check_circle_rounded,size : 18, color: Color(0xff4271ff))),
                          SizedBox(width : 10),
                          Text("아래 약관에 모두 동의합니다.", style : TextStyle(
                              letterSpacing : -0.5,fontSize: 13, fontWeight: FontWeight.w300, color : Color(0xff6b6b6b), decoration: TextDecoration.none)),
                          SizedBox(width : 50),
                        ],
                      ),
                      SizedBox(height : 5),
                      Divider(),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical : 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              for(int i = 0 ; i < bList.length ; i++)
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical : 9.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                        child: GestureDetector(
                                            onTap : (){
                                              setState((){
                                                bList[i] = !bList[i];
                                                for(int i = 0 ; i < bList.length; ++i){
                                                  if(bList[i] == false) total = true;
                                                }
                                              });
                                            }, child: bList[i] ? Icon(Icons.check_circle_rounded,size: 16, color: Color(0xffb8b8b8)):Icon( Icons.check_circle_rounded,size: 16, color: Color(0xff4271ff))),
                                      ),
                                      SizedBox(width : 5),
                                      Text(strList[i], style : TextStyle(letterSpacing: -0.5,
                                          fontSize: 12, fontWeight: FontWeight.w300, color : Color(0xff6b6b6b), decoration: TextDecoration.none)),
                                      Expanded(child: Container()),
                                      Text("보기", style:TextStyle(fontSize : 12, fontWeight: FontWeight.w300, color : Color(0xffb8b8b8),decoration: TextDecoration.underline, decorationColor:Color(0xffb8b8b8))),
                                    ],
                                  ),
                                ),
                            ]
                        ),
                      ),

                    ]
                );
              }),
            ],
          ),

        ]);
  }


  static Widget Dialog(){
    return Center(
        child: GestureDetector(
          onTap:(){
            Get.to(Home(), arguments: 2);
          },
          child: Container(
            height : 217,
            width: 290,
            child: Image.asset("assets/image/Calling/결제완료팝업.png"),
          ),
        )
    );
  }




}

