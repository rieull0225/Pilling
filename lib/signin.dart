import 'package:degree/dataReceive.java.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool total = false;
  bool isChecked = false;
  List<bool> bList = [false, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Padding(
        padding: const EdgeInsets.fromLTRB(18, 102.5 , 13, 17 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("의료데이터 조회를 위해\n최초 1회 본인인증이 필요해요.", style : TextStyle(
                fontSize: 22, fontFamily: 'Gmarket', color : Color(0xff141922),fontWeight: FontWeight.w500)),
            SizedBox(height : 9),
            Text("개인정보 입력 후 본인인증을 완료해주세요.", style:TextStyle(fontSize : 12, color : Color(0xff929292))),
            SizedBox(height : 29 ),
            Text("이름", style : TextStyle(fontSize : 14, color : Color(0xff3d3d3d),)),
            SizedBox(height : 9),
            Container(width : 324, height : 34 , decoration : BoxDecoration(border : Border(bottom : BorderSide(color : Color(0xffdadada)))),
                child : isChecked ? Text("이로사", style : TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color : Color(0xff141922)))
                    : Text("이름 입력", style : TextStyle(fontSize : 14, fontWeight: FontWeight.w500, color : Color(0xffdadada)))),
            SizedBox(height : 28),
            Text("주민등록번호", style : TextStyle(fontSize : 14, color : Color(0xff3d3d3d),)),
            SizedBox(height : 9),
            Row(
              children: [
                Container(width : 140 , height : 34 , decoration : BoxDecoration(border : Border(bottom : BorderSide(color : Color(0xffdadada)))),
                    child : isChecked ? Text("993456", style : TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color : Color(0xff141922)))
                        : Text("생년월일 6자리", style : TextStyle(fontSize : 16, fontWeight: FontWeight.w500, color : Color(0xffdadada)))),
                Container(width : 39, height : 34 , child : Center(child: Text("-",  style : TextStyle(fontSize : 16, fontWeight: FontWeight.w500, color : Color(0xffdadada))))),
                Container(width : 140  , height : 34 , decoration : BoxDecoration(border : Border(bottom : BorderSide(color : Color(0xffdadada)))),
                    child : isChecked ? Text("2******", style : TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color : Color(0xff141922)))
                        : Text("뒷자리 7자리", style : TextStyle(fontSize : 16, fontWeight: FontWeight.w500, color : Color(0xffdadada)))),
              ],
            ),
            SizedBox(height : 21),
            Text("휴대폰 인증", style : TextStyle(fontSize : 14, color : Color(0xff3d3d3d),)),
            SizedBox(height : 18),

            Row(children: [
              Container(width : 72, height : 33, decoration : BoxDecoration(color : Color(0xfff4f4f4), borderRadius: BorderRadius.circular(5)),
              child : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("SKT",style : TextStyle(color : Color(0xff929292), fontSize: 14,)),
                  SizedBox(width : 9),
                  Icon(Icons.keyboard_arrow_down),
                ],
              )),
              SizedBox(width : 11 ),
              Container(width : 143 , height : 29 , decoration : BoxDecoration(border : Border(bottom : BorderSide(color : Color(0xffdadada)))),
                  child : isChecked ? Text("010-1234-5678", style : TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color : Color(0xff141922)))
                      : Text("휴대폰 번호 입력", style : TextStyle(fontSize : 16, fontWeight: FontWeight.w500, color : Color(0xffdadada)))),
              SizedBox(width : 17),
              GestureDetector(child : Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
              border : Border.all(color : Color(0xff4271ff))),
                  width : 81, height : 29 ,child : Center(child: Text("인증 요청", style : TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color : Color(0xff4271ff))))),
                  onTap:(){setState((){isChecked = isChecked ? false:true;});})
            ],),

            SizedBox(height : 18),
            Container(width : 324, height : 34 , decoration : BoxDecoration(border : Border(bottom : BorderSide(color : Color(0xffdadada)))),
                child : isChecked ? Text("527495", style : TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color : Color(0xff141922)))
                    : Text("인증 번호 입력", style : TextStyle(fontSize : 16, fontWeight: FontWeight.w500, color : Color(0xffdadada)))),
            Expanded(child :Container()),
            Container(
              width : 324, height: 48,
                child : isChecked ? ElevatedButton(
                style : ElevatedButton.styleFrom(primary : Color(0xff4271ff),
                    shape : RoundedRectangleBorder(borderRadius : BorderRadius.circular(12),)),
                onPressed:(){
                  Get.defaultDialog(
                    confirm: GestureDetector(
                      onTap : (){
                        Get.to(()=>dataReceivePage());
                      },
                        child: Container(
                          decoration: BoxDecoration(
                            color : total ? Color(0xff4271ff) : Color(0xfff6f8ff),
                          ),
                        height : 48 , width : 303 ,
                        child : Center(
                        child: Text("동의하고 진행하기"))
                    )),
                    titlePadding: EdgeInsets.fromLTRB(0,26 , 0, 0),
                      title : '서비스 약관 동의',
                      titleStyle : TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color : Color(0xff141922)),
                      content : StatefulBuilder(builder : (BuildContext context, StateSetter setState){
                        return Container(
                          width : 303, height : 324,
                          child: Column(
                              children :[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(onPressed : (){
                                      setState((){
                                        total = total ? false : true;
                                        for(int i = 0 ; i < bList.length ; ++i) {
                                          bList[i] = total ? true : false;
                                        }

                                      });
                                    }, icon: total ? Icon(Icons.check_circle_rounded,size : 18, color: Color(0xffb8b8b8)):Icon(Icons.check_circle_rounded,size : 18, color: Color(0xff4271ff))),
                                    Text("아래 약관에 모두 동의합니다.", style : TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color : Color(0xff6b6b6b))),
                                    SizedBox(width : 50),
                                  ],
                                ),
                                SizedBox(height : 15,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(color: Color(0xff4271ff))),
                                      width : 270, height : 238 ,
                                      child : Padding(
                                        padding: const EdgeInsets.symmetric(vertical : 5),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children:[
                                              for(int i = 0 ; i < bList.length ; i++)
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(vertical : 9.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal : 10.0),
                                                        child: GestureDetector(

                                                            onTap : (){
                                                          setState((){
                                                            bList[i] = bList[i] ? false : true;
                                                            for(int i = 0 ; i < bList.length; ++i){
                                                              if(bList[i] == false) total = true;
                                                            }
                                                          });
                                                        }, child: bList[i] ? Icon(Icons.check_circle_rounded,size: 16, color: Color(0xffb8b8b8)):Icon( Icons.check_circle_rounded,size: 16, color: Color(0xff4271ff))),
                                                      ),
                                                      Text("필잉 이용 약관 동의 (필수)", style : TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color : Color(0xff6b6b6b))),
                                                      SizedBox(width : 30),
                                                      Text("보기", style:TextStyle(fontSize : 12, fontWeight: FontWeight.w400, color : Color(0xffb8b8b8),decoration: TextDecoration.underline)),
                                                      SizedBox(width : 12),
                                                    ],
                                                  ),
                                                ),
                                            ]
                                        ),
                                      )
                                  ),
                                ),

                              ]
                          ),
                        );
                      }),

                  );
                },child : Text('다음', style : TextStyle(fontSize: 14, color: Color(0xffffffff), fontWeight: FontWeight.w400)))
                : SizedBox(
                  width : 324, height : 48,
                  child: ElevatedButton(
                  style : ElevatedButton.styleFrom(primary : Color(0xfff6fbff),elevation : 0,
                      shape : RoundedRectangleBorder(borderRadius : BorderRadius.circular(12),)),
                  onPressed:(){

                  },child : Text('다음', style : TextStyle(fontSize: 14, color: Color(0xffb8b8b8), fontWeight: FontWeight.w400))),
                )),

          ],
        ),
      )
    );
  }
}

