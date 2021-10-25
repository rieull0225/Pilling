
import 'package:degree/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class drugOK extends StatelessWidget {
  const drugOK({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading : IconButton(icon: Icon(Icons.close, color : Color(0xff141922)), onPressed: (){Get.back();}, )
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 35),
              SizedBox(height : 65, width : 52, child : Image.asset("assets/image/home/OK.png")),
              SizedBox(height : 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children : [
                Text("콘서타OROS27mg 1정", style: TextStyle(color : Color(0xff4271ff), fontSize: 20, fontFamily: 'Gmarket', fontWeight: FontWeight.w500),),
                Text('을',style: TextStyle(color : Color(0xff141922), fontSize: 20, fontFamily: 'Gmarket',fontWeight: FontWeight.w500),),
              ]),
              Text("복용하셨나요?",style: TextStyle(color : Color(0xff141922), fontSize: 20, fontFamily: 'Gmarket',fontWeight: FontWeight.w500),),
              SizedBox(height : 70),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width : 75,
                  child : Text("복용 예정 시간", style : TextStyle(color : Color(0xff929292), fontSize: 13, fontFamily: 'Apple', fontWeight: FontWeight.w300))),
                  Expanded(child: Container()),
                  Text("오전 07:30am", style : TextStyle(color : Color(0xff6b6b6b), fontSize: 14, )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,14,30,14),
                child: Divider(color : Color(0xfff4f4f4)),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width : 75,
                      child : Text("현재 시간", style : TextStyle(color : Color(0xff929292), fontSize: 13, fontFamily: 'Apple', fontWeight: FontWeight.w300))),
                  Expanded(child: Container()),
                  Text("오전 07:32am", style : TextStyle(color : Color(0xff6b6b6b), fontSize: 14, )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,14,30,14),
                child: Divider(color : Color(0xfff4f4f4)),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width : 75,
                      child : Text("연속 복용한지", style : TextStyle(color : Color(0xff929292), fontSize: 13,  fontWeight: FontWeight.normal))),
                  Expanded(child: Container()),
                  SizedBox(width : 90, child : Text("23일 째", style : TextStyle(color : Color(0xff6b6b6b), fontSize: 14,), textAlign: TextAlign.right,)),

                ],
              ),
              Expanded(child : Container()),
              SizedBox(width : 324, height : 48,
                child: ElevatedButton(
                  onPressed: (){
                    Get.back();
                    Get.dialog(
                      Dialog()
                    );
                  },
                  child: Text("네, 복용했어요."),
                  style : ElevatedButton.styleFrom(
                    primary : Color(0xff4271ff),
                    shape : RoundedRectangleBorder(
                      borderRadius : BorderRadius.circular(10),
                    )
                  )
                ),
              ),
              SizedBox(height : 17,)
            ],
          ),
        ),
      )
    );
  }
}

Widget Dialog(){
  return Center(
    child: Container(
      height : 212,
      width: 290,
      child: Column(
        children: <Widget>[
          Container(
            width : 290,
            height : 164,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
            ),
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height : 20),
                Text("복약체크 완료!👍", style : TextStyle(letterSpacing: -0.01,
                    fontSize: 18, color: Color(0xff141922), fontFamily: 'Gmarket', fontWeight: FontWeight.bold, decoration: TextDecoration.none)),
                SizedBox(height : 20),
                Text("오늘도 잊지 않고 복용에 성공하셨네요!\n건강한 복용 습관으로 나만의 적정용량을 찾고\n자신감 넘치는 하루를 보내세요:)",
                style : TextStyle(letterSpacing: -0.5,
                    color : Color(0xff6b6b6b), fontSize: 13, decoration : TextDecoration.none), textAlign: TextAlign.center,)
              ],
            )
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
    ]),
    ),
  );}

