
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'assets.dart';
import 'package:date_format/date_format.dart';


class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {

  final control = Get.put(ReactiveController());
  int idx = 0;
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Text('저장',style: TextStyle(color:Color(0xffdadada), fontSize: 13,
            ),),
          ),
        )],
        title : Center(child : Text('알림 설정', style: TextStyle(color : Color(0xff141922), fontSize: 14 ),)),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Color(0xff141922),
          icon: Icon(Icons.arrow_back_ios, size: 20),
          onPressed: (){Get.back();},
        ),
      ),
      body: Container(
          width : MediaQuery.of(context).size.width, height : MediaQuery.of(context).size.height,
          child : Padding(
            padding: const EdgeInsets.fromLTRB(18,24,18,24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width : 324,height : 171, child : Image.asset('assets/image/Record/noti.png')),
                SizedBox(height : 13),
                SizedBox(width : 278, child : Image.asset("assets/image/Record/timer.png")),
                SizedBox(height : 11),
                Align(alignment: Alignment.bottomRight, child : GestureDetector(
                  onTap: (){
                    Get.dialog(Dialog());
                  },
                  child: Container(decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xffb8b8b8)),
                  ), width : 139, height : 30,child: Center(child: Text("예상 약효시간 확인하기", style: TextStyle(color:Color(0xff3d3d3d), fontSize: 12, fontWeight: FontWeight.w300),))),
                )),
                SizedBox(height : 12),
                Divider(thickness: 0.5,),
                SizedBox(height : 12),
                SizedBox(width : 280, child : Image.asset("assets/image/Record/day.png")),

                SizedBox(height : 12),
                Divider(thickness: 0.5,),

                Row(
                  children: [
                    Text("복용 가능한 최대 시간 설정", style: TextStyle(color:Color(0xff141922),fontSize: 14, fontWeight: FontWeight.w300),),
                    SizedBox(width: 3,),
                    SizedBox(width : 14, height: 14, child : Image.asset("assets/image/home/Info_light.png")),
                    Expanded(child: Container()),
                    Switch(activeColor: Color(0xff4271ff),
                      activeTrackColor:Color(0xffcddeff) ,
                      value: _switchValue, onChanged: (value){
                        setState(() {
                          _switchValue = value;
                        });
                      },),

                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Text('설정한 시간으로부터 '),
                    Container(
                      width:  50, height : 28,
                      decoration: BoxDecoration(color: Color(0xfffafafa), borderRadius: BorderRadius.circular(5)),
                      child: Center(child: Text('10'),)
                    ),
                    Text(" 분 이내")
                  ],
                )


              ],
            ),
          )
      ),
    );
  }

  Widget Dialog(){
    return Stack(
        children: [
          Center(
              child: Container(
                height : 437,
                width: 290,
                child: Image.asset("assets/image/Record/약효팝업.png"),


              )
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height : 389,
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

