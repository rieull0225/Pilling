
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<bool> _idx = [false,false,false,false,false];
List<String> name = ["잊어버림","부작용 등 건강상의 염려","약이 떨어져서","복용할 필요가 없다고 판단","기타 직접 입력"];
var record = false;

class drugFail extends StatefulWidget {
  const drugFail({Key? key}) : super(key: key);

  @override
  _drugFailState createState() => _drugFailState();
}

class _drugFailState extends State<drugFail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading : IconButton(icon: Icon(Icons.close, color : Color(0xff141922)), onPressed: (){Get.back();}, )
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 23),
                SizedBox(height : 65, width : 52, child : Image.asset("assets/image/Record/실패.png")),
                SizedBox(height : 32),
                Text("어떤 이유로",style: TextStyle(color : Color(0xffff5b64), fontSize: 20, fontFamily: 'Gmarket',fontWeight: FontWeight.w500),),
                Text("복용하지 못했나요?",style: TextStyle(color : Color(0xff141922), fontSize: 20, fontFamily: 'Gmarket',fontWeight: FontWeight.w500),),
                SizedBox(height : 42),
                for(int i = 0 ; i < name.length ; ++i) Buttons(name[i], i),

                _idx[4] == true ? Container(width : 324, height : 85,
                decoration: BoxDecoration(color : Color(0xfff4f4f4)),
                child : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(decoration: InputDecoration(
                    border : InputBorder.none,
                    hintText : "약을 먹지 못한 이유를 자유롭게 입력해주세요.",
                    hintStyle : TextStyle(color : Color(0xffb8b8b8), fontSize: 12)
                  ),),
                ))
                    : Container(),


                SizedBox(height : 30),

                Text("약물 복용에 실패한 원인을 함께 기록하여\n필잉과 함께 건강한 복약습관을 만들어 나가보아요.", style : TextStyle(fontSize: 11, color:Color(0xffb8b8b8),), textAlign: TextAlign.center,),

                SizedBox(height : 15),
                SizedBox(width : 324, height : 48,
                  child: record ?  ElevatedButton(
                      onPressed: (){},
                      child: Text("기록하기", style: TextStyle(color: Color(0xffb8b8b8)),),
                      style : ElevatedButton.styleFrom(
                        elevation : 0,
                          primary : Color(0xfff6f8ff),
                          shape : RoundedRectangleBorder(
                            borderRadius : BorderRadius.circular(10),
                          )
                      )
                  ) : ElevatedButton(
                      onPressed: (){
                        Get.back();
                        Get.dialog(
                            Dialog()
                        );
                      },
                      child: Text("기록하기"),
                      style : ElevatedButton.styleFrom(
                          primary : Color(0xff4271ff),
                          shape : RoundedRectangleBorder(
                            borderRadius : BorderRadius.circular(10),
                          )
                      )
                  )
                ),
                SizedBox(height : 17,)
              ],
            ),
          )],
        )
    );
  }

  Widget Buttons(String text, int idx){
    return
      Padding(
        padding: const EdgeInsets.only(bottom : 8.0),
        child: SizedBox(height : 48,width : 324,
            child : _idx[idx] ? TextButton(onPressed: (){
              setState((){
                buttonPressed(idx);
                record = false;
              });
            },
                style : TextButton.styleFrom(
                  backgroundColor: Color(0xffebf0ff),
                    side : BorderSide(color : Color(0xff4271ff), width : 0.7),
                    shape : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                ),
                child : Text(text, style: TextStyle(fontSize: 13, color: Color(0xff6b6b6b)),))
                :TextButton(onPressed: (){
                  setState(() {
                    buttonPressed(idx);
                    _idx[idx] = true;
                    record = false;
                  });
            },
                style : TextButton.styleFrom(
                    primary: Colors.white,
                    side : BorderSide(color : Color(0xffdadada), width : 0.7),
                    shape : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                ),
                child : Text(text, style: TextStyle(fontSize: 13, color: Color(0xff6b6b6b)),))),
      );
  }

}

buttonPressed(int idx){
  for(int i = 0 ; i < _idx.length ; ++i)
    _idx[i] = false;
  _idx[idx] = _idx[idx] ? false : true;
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
                    Text("복약체크 완료!💊", style : TextStyle(letterSpacing: -0.01,
                        fontSize: 18, color: Color(0xff141922), fontFamily: 'Gmarket', fontWeight: FontWeight.bold, decoration: TextDecoration.none)),
                    SizedBox(height : 20),
                    Text("오늘은 아쉽게도 복용하지 못했군요:(\n내일은 꼭 잊지말고 복용해주세요.\n더 나은 필잉을 위해 함께 힘내자구요!",
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

