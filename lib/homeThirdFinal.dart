
import 'package:degree/homeThird.dart';
import 'package:degree/sideEffect.dart';
import 'package:degree/thirdInhour.dart';
import 'package:degree/thirdOuthour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homeAfterThird.dart';
import 'homeFirst.dart';
import 'package:intl/intl.dart';
import 'package:degree/homeSecond.dart';



class homeThirdFinal extends StatefulWidget {
  const homeThirdFinal({Key? key}) : super(key: key);

  @override
  _homeThirdFinalState createState() => _homeThirdFinalState();
}

class _homeThirdFinalState extends State<homeThirdFinal> {

  String dateFormat = DateFormat('EEEE').format(DateTime.now());
  bool isSet = true;
  bool float = true;
  int _idx = Get.arguments == null ? 0 : 2;
  bool hour = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type : BottomNavigationBarType.fixed,
          selectedFontSize: 9,
          unselectedFontSize: 9,
          selectedLabelStyle: TextStyle(color: Color(0xff4271ff)),
          currentIndex: _idx,
          onTap : (int _idx){
            setState(() {
              this._idx = _idx;
            });
          },
          items :[
            BottomNavigationBarItem(
              label : '홈',
              icon : _idx ==0 ? SizedBox(width: 18, height : 18,child: Image.asset("assets/image/BotNav/하단바_홈_활성.png")):SizedBox(width: 18, height :18,child: Image.asset("assets/image/BotNav/하단바_홈_비활성.png")),
            ),
            BottomNavigationBarItem(
              label : '필잉스토리',
              icon :_idx == 1 ? SizedBox(width: 18, height : 18,child: Image.asset("assets/image/BotNav/하단바_필잉스토리_활성.png")):SizedBox(width: 18, height : 18,child: Image.asset("assets/image/BotNav/하단바_필잉스토리_비활성.png")),
            ),
            BottomNavigationBarItem(
              label : '진료내역',
              icon : _idx == 2 ? SizedBox(width: 18, height : 18,child: Image.asset("assets/image/BotNav/하단바_진료내역_활성.png")): SizedBox(width:18, height : 18,child: Image.asset("assets/image/BotNav/하단바_진료내역_비활성.png")),
            ),

            BottomNavigationBarItem(
              label : '마이페이지',
              icon : _idx == 3?SizedBox(width: 18, height : 18,child: Image.asset("assets/image/BotNav/하단바_마이페이지_활성.png")): SizedBox(width: 18, height : 18,child: Image.asset("assets/image/BotNav/하단바_마이페이지_비활성.png")),
            ),
          ]
      ),
      appBar: null,
      body : ListView(children: hour ? [bodyList2.elementAt(_idx)]:[bodyList.elementAt(_idx)],physics: NeverScrollableScrollPhysics(),),
      floatingActionButton : _idx == 0? FloatingActionButton(
        backgroundColor: Color(0xffff5b64),
        child : Image.asset("assets/image/home/Vector.png",fit: BoxFit.fill,),
        onPressed: (){
          Get.to(SideEff());
        },
      ) : null,
    );
  }
  List bodyList2 = [
    homeFirst(),
    homeSecond(),
    thirdInFinal(),
    homeFirst(),
  ];

  List bodyList = [
    homeFirst(),
    homeSecond(),
    thirdOutFinal(),
    homeFirst(),
  ];

}


