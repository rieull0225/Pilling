
import 'package:degree/changeHos.dart';
import 'package:degree/search_result.dart';
import 'package:degree/search_result_after.dart';
import 'package:degree/timeSelect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class reservation extends StatefulWidget {
  const reservation({Key? key}) : super(key: key);

  @override
  _reservationState createState() => _reservationState();
}

class _reservationState extends State<reservation> {

  final hospital = Get.arguments;
  var isSelected = false;
  var box1 = false;
  var box2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
            height : 250, width : MediaQuery.of(context).size.width,
            child : Padding(
              padding: const EdgeInsets.fromLTRB(18,18,18,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('병원과 의료진을 확인 후 선택해주세요',
                    style: TextStyle(color : Color(0xff141922), fontSize: 15, fontFamily: 'Gmarket',fontWeight: FontWeight.w500),),
                  SizedBox(height : 4),
                  Text('※ 서비스 가입 시 등록된 병원이 기본으로 설정됩니다.',
                    style: TextStyle(color : Color(0xffff5b64), fontSize: 10, fontFamily: 'Apple',fontWeight: FontWeight.w400),),
                  Align(
                    alignment: Alignment.centerRight,
                    child : GestureDetector(
                      onTap: ()=>Get.dialog(Dialog()),
                      child: Container(
                        width : 61, height : 22,
                        decoration: BoxDecoration(
                          color : Color(0xfff4f4f4),
                          borderRadius: BorderRadius.circular(15.5),
                        ),
                        child : Center(child: Text("병원 변경",
                          style: TextStyle(color : Color(0xff6691ff), fontSize: 11, fontFamily: 'Apple',fontWeight: FontWeight.w500),),)
                      ),
                    )
                  ),
                  SizedBox(height : 13),
                  GestureDetector(
                    child : isSelected ? selected() : Unselected(),
                    onTap : (){
                      setState(() {
                        isSelected = !isSelected;
                      });
                    }
                  ),


                ],
              ),
            )
          ),
          Container(height : 7, width:  MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color(0xfff4f4f4)),),
          isSelected ? Container(
            width : MediaQuery.of(context).size.width,
            height : 370,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('진료 유형을 선택해주세요', style: TextStyle(color : Color(0xff141922), fontSize: 15, fontFamily: 'Gmarket',fontWeight: FontWeight.w500)),
                  SizedBox(height : 22),
                  Row(
                    children: [
                      GestureDetector(
                        onTap : (){
                          setState(() {
                            box1 = !box1;
                            box2 = false;
                          });
                        },
                        child: Container(height : 98, width : 158,
                        child : box1 ? Image.asset("assets/image/Booking/진료유형_전화선택.png") : Image.asset("assets/image/Booking/진료유형_전화미선택.png")),
                      ),
                      SizedBox(width : 8),
                      GestureDetector(
                        onTap : (){
                          setState(() {
                            box2 = !box2;
                            box1 = false;
                          });
                        },
                        child: SizedBox(height : 98, width : 158,
                            child : box2 ? Image.asset("assets/image/Booking/진료유형_화상선택.png") : Image.asset("assets/image/Booking/진료유형_화상미선택.png")),
                      )
                    ],
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap:(){
                      Get.to(timeSelect());
                      },
                    child: Container(
                      width : 324, height : 48,
                      decoration: BoxDecoration(
                        color : Color(0xff4271ff),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child : Center(child : Text("날짜/시간 선택하기", style: TextStyle(color : Colors.white, fontSize: 14, fontFamily: 'Apple',fontWeight: FontWeight.w400))),
                    ),
                  )
                ],
              ),
            ),
          ) : Container(
            width : MediaQuery.of(context).size.width,
            height : 370,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('진료 유형을 선택해주세요', style: TextStyle(color : Color(0xff141922), fontSize: 15, fontFamily: 'Gmarket',fontWeight: FontWeight.w500)),
                  SizedBox(height : 22),

                  Expanded(child: Container()),
                  Container(
                    width : 324, height : 48,
                    decoration: BoxDecoration(
                      color : Color(0xfff8faff),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child : Center(child : Text("날짜/시간 선택하기", style: TextStyle(color : Color(0xffb8b8b8), fontSize: 14, fontFamily: 'Apple',fontWeight: FontWeight.w400))),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }

  Widget selected(){
    return Container(
        width : 324, height : 131,
        decoration: BoxDecoration(
          color: Color(0xffebf0ff),
          border : Border.all(color : Color(0xff4271ff), width : 0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(height : 50, width: 50, child : Image.asset("assets/image/${hospital.name}/${hospital.doctor[0]} 원장.png")),
                  SizedBox(width : 11),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hospital.name, style: TextStyle(color: Color(0xff3d3d3d), fontSize: 12, fontWeight: FontWeight.w400),),
                      Text(hospital.doctor[0] + " 원장", style: TextStyle(color: Color(0xff141922), fontSize: 16, fontWeight: FontWeight.w500),),
                    ],
                  )
                ],
              ),
              SizedBox(height: 13),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("최근 진료일\n2021.10.15.(금)", style: TextStyle(color: Color(0xff6b6b6b), fontSize: 12, fontWeight: FontWeight.w400),),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap : (){
                      Get.to(()=> search_result_after(), arguments: hospital);
                    },
                    child : Row(
                      children: [
                        Text("병원 정보 상세보기", style: TextStyle(color: Color(0xff3d3d3d), fontSize: 12, fontWeight: FontWeight.w400),),
                        Icon(Icons.arrow_forward_ios, size: 12,)
                      ],
                    ),
                  ),

                ],
              )

            ],
          ),
        )
    );
  }
  Widget Unselected(){
    return Container(
        width : 324, height : 131,
        decoration: BoxDecoration(
          border : Border.all(color : Color(0xffdadada), width : 0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(height : 50, width: 50, child : Image.asset("assets/image/${hospital.name}/${hospital.doctor[0]} 원장.png")),
                  SizedBox(width : 11),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hospital.name, style: TextStyle(color: Color(0xff3d3d3d), fontSize: 12, fontWeight: FontWeight.w400),),
                      Text(hospital.doctor[0] + " 원장", style: TextStyle(color: Color(0xff141922), fontSize: 16, fontWeight: FontWeight.w500),),
                    ],
                  )
                ],
              ),
              SizedBox(height: 13),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("최근 진료일\n2021.10.15.(금)", style: TextStyle(color: Color(0xff6b6b6b), fontSize: 12, fontWeight: FontWeight.w400),),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap : (){
                      Get.to(()=> search_result_after(), arguments: hospital);
                    },
                    child : Row(
                      children: [
                        Text("병원 정보 상세보기", style: TextStyle(color: Color(0xff3d3d3d), fontSize: 12, fontWeight: FontWeight.w400),),
                        Icon(Icons.arrow_forward_ios, size: 12,)
                      ],
                    ),
                  ),

                ],
              )

            ],
          ),
        )
    );
  }


  Widget Dialog(){
    return Stack(
        children: [
          Center(
              child: Container(
                height : 384,
                width: 294,
                child: Image.asset("assets/image/Booking/병원변경버튼팝업.png"),


              )
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height : 156,
                ),
                GestureDetector(
                  onTap:(){
                    Get.back();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width : 145,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Color(0xffdadada),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: Center(
                          child: Text(
                            "취소",
                            style: TextStyle(color: Color(0xff3d3d3d), fontSize: 14, decoration: TextDecoration.none),
                            textAlign: TextAlign.center,

                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(changeHos()),
                        child: Container(
                          width : 145,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Color(0xff4271ff),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text(
                              "변경할래요",
                              style: TextStyle(color: Colors.white, fontSize: 14, decoration: TextDecoration.none),
                              textAlign: TextAlign.center,

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]
    );
  }


}

