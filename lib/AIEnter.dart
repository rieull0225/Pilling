
import 'package:degree/AIDoctor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
class AIEnter extends StatefulWidget {
  const AIEnter({Key? key}) : super(key: key);

  @override
  _AIEnterState createState() => _AIEnterState();
}

class _AIEnterState extends State<AIEnter> {
  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width, height : MediaQuery.of(context).size.height,
    decoration: BoxDecoration(color: Color(0xff4271ff)),
    child : Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(1.5,20,309.5,0),
            child: GestureDetector(
              onTap: (){
                Get.back();
              },
                child: SizedBox(width : 13, height : 13,child : Icon(Icons.close, color: Colors.white, size: 20,))),
          ),
          SizedBox(height : 30.5),
          Text("필잉의 비대면 약물 처방 서비스\nAI 진료를 시작합니다",
            style: TextStyle(color : Colors.white, fontSize: 20, fontFamily: 'Gmarket',
                fontWeight: FontWeight.w500, decoration: TextDecoration.none, ),textAlign: TextAlign.center),
          SizedBox(height : 13,),
          Text("아래 설명과 유의사항을 읽고 진료실에 입장해주세요.",
              style: TextStyle(color : Colors.white, fontSize: 12, fontFamily: 'Apple',
                fontWeight: FontWeight.w200, decoration: TextDecoration.none, ),textAlign: TextAlign.center),
          SizedBox(height : 40),
          Container(
            height : 368, width : 324,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child : Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height : 6),
                  Text('AI 진료란?', style: TextStyle(color : Color(0xff141922), fontSize: 15, fontFamily: 'Gmarket',
                    fontWeight: FontWeight.w500, decoration: TextDecoration.none, ),textAlign: TextAlign.center),
                  SizedBox(height : 9),
                  Text('의사와의 직접적인 진료 없이 인공지능과'
                      ' 머신러닝으로 환자의 복용 및 부작용 기록 데이터를'
                      ' 분석해 쉽고 빠른 동일 약물 처방 또는 약물 조절을'
                      ' 도와주는 비대면 진료 서비스입니다.', style: TextStyle(color : Color(0xff141922), fontSize: 13, fontFamily: 'Apple',
                    fontWeight: FontWeight.w300, decoration: TextDecoration.none, ),textAlign: TextAlign.start),
                  SizedBox(height : 13),
                  Container(height : 71, width : 287, decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xff4271ff),),
                  ),child : Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Row(
                      children: [
                        SizedBox(width : 10),
                        Container(width : 67, height : 36, child: Text('AI 비대면\n진료 조건', style: TextStyle(color : Color(0xff4271ff), fontSize: 14, fontFamily: 'Gmarket',
                      fontWeight: FontWeight.w500, decoration: TextDecoration.none, ),textAlign: TextAlign.center)),
                        SizedBox(
                          width : 22,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height : 5),
                            Text('·\t서비스 사용기간 3개월 이상', style: TextStyle(color : Color(0xff4271ff), fontSize: 11, fontFamily: 'Apple',
                              fontWeight: FontWeight.w400, decoration: TextDecoration.none, ),textAlign: TextAlign.center),
                            Text('·\t동일한 약물 연속 3회 이상 처방 ', style: TextStyle(color : Color(0xff4271ff), fontSize: 11, fontFamily: 'Apple',
                              fontWeight: FontWeight.w400, decoration: TextDecoration.none, ),textAlign: TextAlign.center),
                            Text('·\t담당 의사의 사전 동의 ', style: TextStyle(color : Color(0xff4271ff), fontSize: 11, fontFamily: 'Apple',
                              fontWeight: FontWeight.w400, decoration: TextDecoration.none, ),textAlign: TextAlign.center)

                          ],
                        ),
                      ],
                    ),
                  )
                  ),
                  SizedBox(height : 28),
                  Text('진료 시 유의사항', style: TextStyle(color : Color(0xff141922), fontSize: 15, fontFamily: 'Gmarket',
                    fontWeight: FontWeight.w500, decoration: TextDecoration.none, ),textAlign: TextAlign.center),
                  SizedBox(height : 9),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('1)', style: TextStyle(color : Color(0xff141922), fontSize: 13, fontFamily: 'Apple',
                        fontWeight: FontWeight.w500, decoration: TextDecoration.none, ),textAlign: TextAlign.start),
                      SizedBox(width : 7.6),
                      Text('약물의 용량 조절 또는 약물 종류 변경은 전화 또는 화상\n진료를 통해서만 가능합니다.', style: TextStyle(color : Color(0xff141922), fontSize: 13, fontFamily: 'Apple',
                        fontWeight: FontWeight.w500, decoration: TextDecoration.none, ),textAlign: TextAlign.start),
                    ],
                  ),
                  SizedBox(height : 7),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('2)', style: TextStyle(color : Color(0xff141922), fontSize: 13, fontFamily: 'Apple',
                        fontWeight: FontWeight.w500, decoration: TextDecoration.none, ),textAlign: TextAlign.start),
                      SizedBox(width : 7.6),
                      Text('환자와의 공유 데이터 분석 중 이상이 발견되어 의사와의\n진료가 필요하다고 판단이 될시 약물 처방이 불가하며\n'
                          '전화 및 화상 진료 예약 페이지로 이동합니다.', style: TextStyle(color : Color(0xff141922), fontSize: 13, fontFamily: 'Apple',
                        fontWeight: FontWeight.w500, decoration: TextDecoration.none, ),textAlign: TextAlign.start),
                    ],
                  ),

                ],
              ),
            ),
          ),
          Expanded(child: Container()),
          GestureDetector(
            onTap: (){
              Get.to(AIDoctor());
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color:Colors.white),
                borderRadius: BorderRadius.circular(10)
              ),
              width : 324, height : 48, child :Center(
                child: Text('진료실 입장하기', style: TextStyle(color : Colors.white, fontSize: 14, fontFamily: 'Apple',
                fontWeight: FontWeight.w200, decoration: TextDecoration.none, ),textAlign: TextAlign.start),
              ),
            ),
          )

        ],
      ),
    ));
  }
}
