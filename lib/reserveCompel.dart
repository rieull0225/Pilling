
import 'package:degree/assets.dart';
import 'package:degree/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class reserveCompel extends StatefulWidget {
  const reserveCompel({Key? key}) : super(key: key);

  @override
  _reserveCompelState createState() => _reserveCompelState();
}

class _reserveCompelState extends State<reserveCompel> {
  @override
  //date, time, request
  var argu = Get.arguments;
  int date = Get.arguments[0];
  String time = Get.arguments[1];
  String request = Get.arguments[2];
  bool _switchValue = true;
  var  _selectedValue = '10';
  final _valueList = ['5','10', '15', '20', '30'];
  final control = Get.put(ReactiveController());

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [IconButton(icon: Icon(Icons.close,), onPressed: () {
            Get.back();
          }, color: Colors.white,)
          ],

          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Color(0xff141922),
            icon: Icon(Icons.close, size: 16,),
            onPressed: () {
              control.reserve = true.obs;
              Get.offAll(Home());
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            width : MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("진료 예약이 요청되었습니다!", style: TextStyle( color : Color(0xff141922), fontSize: 20, fontFamily: 'Gmarket', fontWeight: FontWeight.w500),),
                SizedBox(height : 15),
                Text("해당 병원에서 진료 예약 접수 확인 중입니다.\n예약이 확정되면 푸시로 안내해드립니다.",
                  style: TextStyle(color : Color(0xff929292), fontSize: 12),textAlign: TextAlign.center,),
                SizedBox(height :26),
                SizedBox(height : 66 , width : 286, child : Image.asset('assets/image/Booking/진료단계1_예약.png')),
                SizedBox(height : 26),
                Container(
                  decoration: BoxDecoration(color: Color(0xfff8faff), borderRadius: BorderRadius.circular(10)),
                  width : 324, height : 394,
                  child : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        SizedBox(height : 13),
                        Row(
                          children: [
                            SizedBox(height : 43, width : 43, child : Image.asset("assets/image/${Information.hospital}/${Information.doctor} 원장.png")),
                            SizedBox(width : 9),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${Information.hospital}", style: TextStyle( color : Color(0xff3d3d3d), fontSize: 11, fontWeight: FontWeight.w400),),
                                Text("${Information.doctor} 원장", style: TextStyle( color : Color(0xff141922), fontSize: 15,  fontWeight: FontWeight.w500),)
                              ],
                            ),
                            Expanded(child : Container()),
                            SizedBox(width : 70, height : 22 ,  child : Image.asset('assets/image/Booking/전화진료.png')),
                          ],
                        ),
                        SizedBox(height : 12),
                        Divider(color : Color(0xffa0b8ff), thickness: 0.5,),
                        SizedBox(height : 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Column(
                            children: [
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
                                    Text("${Information.hospital}",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                                  ],
                                ),
                              ),Padding(
                                padding: const EdgeInsets.symmetric(vertical: 3),
                                child: Row(
                                  children: [
                                    Text("담당 의사",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                                    Expanded(child : Container()),
                                    Text("${Information.doctor} 원장",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text("추가 알림 설정",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                                  Expanded(child : Container()),
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
                                  Expanded(child : Container()),
                                  SizedBox(
                                    width :59, height : 28,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        value : _selectedValue,
                                        items : _valueList.map(
                                                (value) {
                                                  return DropdownMenuItem(
                                                    value : value,
                                                      child: Text(value),
                                                  );
                                                },)
                                          .toList(),
                                        onChanged : (value){
                                          setState((){
                                            _selectedValue = value.toString();
                                          });
                                        }
                                      ),
                                    ),
                                  ),
                                  Text("분 전 알림",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w400,),),
                                ],
                              ),
                              Divider(),
                              SizedBox(height : 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width : 16, height : 16, child : Image.asset('assets/image/Booking/느낌표_빨간색.png'),
                                  ),
                                  SizedBox(width : 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("진료 예약 시 유의사항",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w500,),),
                                      SizedBox(height : 7),
                                      Text("환자가 예약시간 내 진료실에 입장하지 않을 시, 자동으로\n진료가 취소됩니다.",
                                        style: TextStyle(color : Color(0xff3d3d3d), fontSize: 11, fontWeight: FontWeight.w400,),),
                                      SizedBox(height : 7),
                                      Text("환자의 복약 및 부작용 기록이 일정 기준 이상 이루어지지\n않을 시 진료 예약이 취소될 수 있습니다. ",
                                        style: TextStyle(color : Color(0xff3d3d3d), fontSize: 11, fontWeight: FontWeight.w400,),),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )


                      ],
                    ),
                  )

                )

              ],
            ),
          ),
        )
    );
  }
}

