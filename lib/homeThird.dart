import 'package:degree/drug1.dart';
import 'package:degree/drug2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'assets.dart';

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


  @override
  Widget build(BuildContext context) {
    return Container(height : MediaQuery.of(context).size.height,
      child: DefaultTabController(
        length : 3,
        child: Scaffold(
          backgroundColor: Colors.white,

            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('진료내역',style: TextStyle(color:Colors.black, fontSize:18, fontFamily: 'Gmarket', fontWeight: FontWeight.w700),),
                      SizedBox(height : 12),
                      Text('예약된 진료', style: TextStyle(color : Color(0xff141922), fontFamily: 'Gmarket', fontWeight: FontWeight.w500, fontSize: 16)),
                      control.reserve == true.obs ?  ReservationCard(idx) :
                      Container(width : MediaQuery.of(context).size.width,
                        height : 176, child: Center(child: Text("현재 예약된 진료가 없습니다.", style : TextStyle(color : Color(0xffa0b8ff), fontSize: 13, fontWeight: FontWeight.w400) )),),
                    ],
                  ),
                ),
                Container(width : MediaQuery.of(context).size.width , height : 7, color : Color(0xffebebeb)),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(width : MediaQuery.of(context).size.width),
                      Text('진료 완료 내역', style: TextStyle(color : Color(0xff141922), fontFamily: 'Gmarket', fontWeight: FontWeight.w500, fontSize: 16)),
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

  List<Widget> cards =[


  ];

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


}

