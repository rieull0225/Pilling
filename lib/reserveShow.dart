
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'assets.dart';
import 'package:date_format/date_format.dart';


class reserveShow extends StatefulWidget {
  const reserveShow({Key? key}) : super(key: key);

  @override
  _reserveShowState createState() => _reserveShowState();
}

class _reserveShowState extends State<reserveShow> {
  final control = Get.put(ReactiveController());
  int idx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.arrow_back_ios,),onPressed: (){Get.back();},color: Colors.white,)],
        title : Center(child : Text('예약내역 확인', style: TextStyle(color : Color(0xff141922), fontSize: 14 ),)),
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
              SizedBox(height : 13),
              Text("예약내역", style : TextStyle(color : Color(0xff141922), fontSize: 15, fontFamily: 'Gmarket', fontWeight: FontWeight.w500)),
              SizedBox(height :28),
              Row(
                children: [
                  SizedBox(height : 43, width : 43, child : Image.asset("assets/image/마음샘정신건강의학과/김진규 원장.png")),
                  SizedBox(width : 9),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("마음샘정신건강의학과", style: TextStyle( color : Color(0xff3d3d3d), fontSize: 11, fontWeight: FontWeight.w500),),
                      Text("김진규 원장", style: TextStyle( color : Color(0xff141922), fontSize: 15,  fontWeight: FontWeight.w500),)
                    ],
                  ),
                  Expanded(child : Container()),
                  Row(
                    children: [
                      SizedBox(width : 70, height : 22 ,  child : Image.asset('assets/image/Detail/confirm.png')),
                      SizedBox(width : 5),
                      SizedBox(width : 70, height : 22 ,  child : Image.asset('assets/image/Detail/call.png')),
                    ],
                  ),
                ],
              ),
              SizedBox(height : 12),
              Divider(thickness: 0.5,),
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
                          Text("접수일",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w300,),),
                          Expanded(child : Container()),
                          Text("${DateFormat('yyyy년 MM월 dd일').format(DateTime.now())}",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w300,),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          Text("예약 시간",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w300,),),
                          Expanded(child : Container()),
                          Text("${DateFormat('yyyy년 MM월 dd일 hh:mmaaa').format(DateTime.now())}",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w300,),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          Text("약물 조절 요청사항",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w300,),),
                          Expanded(child : Container()),
                          Text("증량하고 싶어요",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w300,),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          Text("추가 알림 설정",style: TextStyle(color : Color(0xff929292), fontSize: 13, fontWeight: FontWeight.w300,),),
                          Expanded(child : Container()),
                          Text("10분 전 알림",style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontWeight: FontWeight.w300,),),
                        ],
                      ),
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
                            Text("환자가 예약시간 내 진료실에 입장하지 않을 시, 자동으로 진료가 \n취소됩니다.",
                              style: TextStyle(color : Color(0xff3d3d3d), fontSize: 11, fontWeight: FontWeight.w300,),),
                            SizedBox(height : 7),
                            Text("환자의 복약 및 부작용 기록이 일정 기준 이상 이루어지지 않을 시 \n진료 예약이 취소될 수 있습니다. ",
                              style: TextStyle(color : Color(0xff3d3d3d), fontSize: 11, fontWeight: FontWeight.w300,),),
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
      ),
    );
  }


}

