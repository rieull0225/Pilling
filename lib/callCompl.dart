
import 'package:degree/assets.dart';
import 'package:degree/home.dart';
import 'package:degree/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class callCompl extends StatefulWidget {
  const callCompl({Key? key}) : super(key: key);

  @override
  _callComplState createState() => _callComplState();
}

class _callComplState extends State<callCompl> {
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
            icon: Icon(Icons.close, size: 20,),
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
                Text("진료가 완료되었습니다!", style: TextStyle( color : Color(0xff141922), fontSize: 20, fontFamily: 'Gmarket', fontWeight: FontWeight.w500),),
                SizedBox(height : 15),
                Text("진료비 결제 후 처방전이 발급됩니다.\n처방전 발급에는 시간이 소요될 수 있습니다.",
                  style: TextStyle(color : Color(0xff929292), fontSize: 12),textAlign: TextAlign.center,),
                SizedBox(height :26),
                SizedBox(height : 66 , width : 286, child : Image.asset('assets/image/Calling/progress.png')),
                SizedBox(height : 26),
                Container(
                    decoration: BoxDecoration(color: Color(0xfff8faff), borderRadius: BorderRadius.circular(10)),
                    width : 324, height : 323,
                    child : Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          SizedBox(height : 13),
                          Row(
                            children: [
                              SizedBox(height : 43, width : 43, child : Image.asset("assets/image/마음샘정신건강의학과/김진규 원장.png")),
                              SizedBox(width : 9),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("마음샘정신건강의학과", style: TextStyle( color : Color(0xff3d3d3d), fontSize: 11, fontWeight: FontWeight.w400),),
                                  Text("김진규 원장", style: TextStyle( color : Color(0xff141922), fontSize: 15,  fontWeight: FontWeight.w500),)
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
                                      Text("진료일시",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w300,),),
                                      Expanded(child : Container()),
                                      Text("${DateFormat('yyyy년 MM월 dd일 hh:mmaaa').format(DateTime.now())}",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w300,),),
                                    ],
                                  ),
                                ),
                                Divider(),
                                SizedBox(height : 10),
                                Row(
                                  children: [
                                    Text("의사소견",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w400,),),
                                    Expanded(child:Container()),
                                  ],
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
                    Get.to(()=>payment());
                  },
                  child: Container(
                    width : 324, height : 48,
                    decoration: BoxDecoration(color : Color(0xff4271ff), borderRadius: BorderRadius.circular(12)),
                    child: Center(child  : Text("진료비 결제", style : TextStyle(color : Colors.white, fontSize: 14,))),
                  ),
                )

              ],
            ),
          ),
        )
    );
  }
}

