
import 'package:degree/changeHos.dart';
import 'package:degree/reserveCompel.dart';
import 'package:degree/search_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'assets.dart';


class request extends StatefulWidget {
  const request({Key? key}) : super(key: key);

  @override
  _requestState createState() => _requestState();
}
class Buttons{
  String label;
  int idx;
  Buttons({required this.label, required this.idx});
}

List<bool> boolList = [for(int i = 0 ; i < buttonList.length ; i++) false];

List<Buttons> buttonList = [
  Buttons(label : "유지하고 싶어요", idx : 0),
  Buttons(label: "증량하고 싶어요", idx : 1),
  Buttons(label: "감량하고 싶어요", idx : 2),
  Buttons(label: "약의 종류를 바꿔보고 싶어요", idx : 3),
  Buttons(label: "기타 직접 입력", idx : 4),
];



class _requestState extends State<request> {
  @override
  TextEditingController _controller = TextEditingController();
  int date = Get.arguments[0];
  String time = Get.arguments[1];
  bool isSet = false;
  String request = '';
  final control = Get.put(ReactiveController());



  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [IconButton(icon: Icon(Icons.arrow_back_ios,),onPressed: (){Get.back();},color: Colors.white,)],
          title : Center(child : Text('전화/화상진료 예약', style: TextStyle(color : Color(0xff141922), fontSize: 14 ),)),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Color(0xff141922),
            icon: Icon(Icons.arrow_back_ios, size: 16,),
            onPressed: (){Get.back();},
          ),
        ),
        body:ListView(
          children: [
            Container(
              height : MediaQuery.of(context).size.height - 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('약물 조절 시 요청사항이 있나요?',
                          style: TextStyle(color : Color(0xff141922), fontSize: 15, fontFamily: 'Gmarket',fontWeight: FontWeight.w400),),
                        SizedBox(height : 4),
                        Text('※ 해당 요청사항은 진료시 담당 의료진에게 전달됩니다.',
                          style: TextStyle(color : Color(0xffff5b64), fontSize: 10, fontFamily: 'Apple',fontWeight: FontWeight.w400),),
                        SizedBox(height : 16),
                        for(int i = 0 ; i < buttonList.length ; i++)
                          Buttons(buttonList[i].label, i),
                        SizedBox(height : 15),
                        boolList[boolList.length-1] ? Container(
                          width : 324, height : 85,
                          decoration: BoxDecoration(color: Color(0xfff4f4f4), borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14.0),
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                border : InputBorder.none,
                                hintText :"ex) 약을 조금 쉬었다 먹을 수 있을까요?",
                              hintStyle: TextStyle(color : Color(0xffb8b8b8), fontSize: 12, decoration: TextDecoration.none)),

                              ),
                          ),
                          ):Container(),
                      ],
                    ),
                  ),

                  Expanded(child : Container()),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: isSet ? GestureDetector(
                      onTap : (){
                        Get.bottomSheet(BottomSheet());
                      },
                      child: Container(
                        width : 324, height : 48,
                        decoration: BoxDecoration(
                          color : Color(0xff4271ff),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child : Center(child : Text("요청사항 입력하기", style: TextStyle(color : Colors.white, fontSize: 14, fontFamily: 'Apple',fontWeight: FontWeight.w400))),
                      ),
                    ):Container(
                      width : 324, height : 48,
                      decoration: BoxDecoration(
                        color : Color(0xfff8faff),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child : Center(child : Text("요청사항 입력하기", style: TextStyle(color : Color(0xffb8b8b8), fontSize: 14, fontFamily: 'Apple',fontWeight: FontWeight.w400))),
                    ),
                  ),
                  SizedBox(height : 18),


                ],
              ),
            ),
          ],
        )
    );
  }

  Widget BottomSheet(){
    return Container(
      height : 415,
      width : MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius : BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )
      ),
      child : Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("2021년 10월 ${date}일 ${time}",style: TextStyle(color : Color(0xff4271ff), fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Gmarket'),),
                  Text("에",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Gmarket'),),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("전화진료",style: TextStyle(color : Color(0xff4271ff), fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Gmarket'),),
                Text("를 예약하시겠습니까?",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Gmarket'),),
              ],
            ),
            SizedBox(height :8),
            Divider(),
            SizedBox(height : 8),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  Text("환자명",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                  Expanded(child : Container()),
                  Text("이로사",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  Text("병원",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                  Expanded(child : Container()),
                  Text("한동 정신과의원",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                ],
              ),
            ),Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  Text("담당 의사",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                  Expanded(child : Container()),
                  Text("김준상 의사",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                ],
              ),
            ),
            SizedBox(height : 8),
            Divider(),
            SizedBox(height : 8),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  Text("진료 유형",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                  Expanded(child : Container()),
                  Text("전화 진료",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  Text("예약 시간",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                  Expanded(child : Container()),
                  Text("2021년 10월 ${date}일 ${time}",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  Text("약물 조절 요청사항",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                  Expanded(child : Container()),
                  Text(request,style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                ],
              ),
            ),
            SizedBox(height : 8),
            Divider(),
            SizedBox(height : 8),
            Row(
              children : [
                Container(
                  child : Center(child: Text("취소",style: TextStyle(color : Color(0xff6b6b6b), fontSize: 14, fontWeight: FontWeight.w400,),),),
                  width : 104,
                  height : 48,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color:Color(0xff929292))),
                ),
                SizedBox(width : 8),

                GetX<ReactiveController>(
                    builder : (_) {
                      return Container();
                    }
                ),

                GestureDetector(
                  onTap: (){
                    control.reserve = true.obs;
                    Get.to(reserveCompel(), arguments: [date, time, request]);
                  },
                  child: Container(
                    child : Center(child: Text("확인",style: TextStyle(color : Colors.white, fontSize: 14, fontWeight: FontWeight.w400,),),),
                    width : 188,
                    height : 48,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0xff4271ff)),
                  ),
                ),
              ]
            )

          ],
        ),
      )
    );
  }

  Widget Buttons(String label, int idx){
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
        child : Center(child: Text(label, style: TextStyle(fontSize: 13, color: Color(0xff6b6b6b)),))
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
            child : Center(child: Text(label, style: TextStyle(fontSize: 13, color: Color(0xff6b6b6b)),))
        ),
      )
    );
  }
}

