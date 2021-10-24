
import 'package:date_format/date_format.dart';
import 'package:degree/assets.dart';
import 'package:degree/payment.dart';
import 'package:degree/prescImage.dart';
import 'package:degree/sendPresc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';



class prescription extends StatefulWidget {
  const prescription({Key? key}) : super(key: key);

  @override
  _prescriptionState createState() => _prescriptionState();
}

class _prescriptionState extends State<prescription> {
  @override
  final control = Get.put(ReactiveController());

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
          actions: [IconButton(icon: Icon(Icons.close,), onPressed: () {
            Get.back();
          }, color: Colors.white,)
          ],

          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Color(0xff141922),
            icon: Icon(Icons.arrow_back_ios, size: 20,),
            onPressed: () {
              Get.back();
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
                Text("처방전이 발급되었습니다!", style: TextStyle( color : Color(0xff141922), fontSize: 20, fontFamily: 'Gmarket', fontWeight: FontWeight.w500),),
                SizedBox(height : 15),
                Text("처방전을 약국으로 전송해 방문 수령을 하시거나\n약물 픽업 시간을 예약해주세요.",
                  style: TextStyle(color : Color(0xff929292), fontSize: 12),textAlign: TextAlign.center,),
                SizedBox(height :26),
                SizedBox(height : 66 , width : 286, child : Image.asset('assets/image/Booking/진료단계4.png')),
                SizedBox(height : 26),
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(color : Color(0xfff7a0a6)),
                        color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    width : 324, height : 323,
                    child : Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Row(
                            children: [

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("환자보관용", style: TextStyle( color : Color(0xff3d3d3d), fontSize: 12, fontWeight: FontWeight.w400),),
                                  Text("모바일처방전", style: TextStyle( color : Color(0xff141922), fontSize: 15,  fontWeight: FontWeight.w500),),
                                  Text('발급일자 ${formatDate(DateTime.now(),[yyyy,'.',mm,'.',dd,])}', style: TextStyle( color : Color(0xffff5b64), fontSize: 12,  fontWeight: FontWeight.w300),)
                                ],
                              ),
                              Expanded(child : Container()),
                              GestureDetector(
                                onTap:(){
                                  Get.to(()=>prescImage());
                                },
                                  child: SizedBox(width : 60, height : 60 ,  child : Image.asset('assets/image/Detail/실제처방전보기.png'))),
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
                                      Text("병원명",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w300,),),
                                      Expanded(child : Container()),
                                      Text("마음샘정신건강의학과",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w300,),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    children: [
                                      Text("의사명",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w300,),),
                                      Expanded(child : Container()),
                                      Text("김진규 원장",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w300,),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    children: [
                                      Text("환자명",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w300,),),
                                      Expanded(child : Container()),
                                      Text("이로사",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w300,),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    children: [
                                      Text("복용횟수",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w300,),),
                                      Expanded(child : Container()),
                                      Text("1일 1회/14일",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w300,),),
                                    ],
                                  ),
                                ),
                                Divider(),
                                SizedBox(height : 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    children: [
                                      Text("콘서타OROS서방정 36mg",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w300,),),
                                      Expanded(child : Container()),
                                      Text("1정  /  1회",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w300,),),
                                    ],
                                  ),
                                ),Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    children: [
                                      Text("아빌리파이정 2mg",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w300,),),
                                      Expanded(child : Container()),
                                      Text("1정\t\t/\t\t1회",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w300,),),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          )


                        ],
                      ),
                    )

                ),
                Expanded(child : Container()),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>sendPresc());
                  },
                  child: Container(
                    width : 324, height : 48,
                    decoration: BoxDecoration(color : Color(0xff4271ff), borderRadius: BorderRadius.circular(12)),
                    child: Center(child  : Text("처방전 전송하기", style : TextStyle(color : Colors.white, fontSize: 14,))),
                  ),
                )

              ],
            ),
          ),
        )
    );
  }
}

