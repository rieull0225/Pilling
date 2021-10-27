
import 'package:degree/changeHos.dart';
import 'package:degree/request.dart';
import 'package:degree/search_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class timeSelect extends StatefulWidget {
  const timeSelect({Key? key}) : super(key: key);

  @override
  _timeSelectState createState() => _timeSelectState();
}

List<bool> selectList = [for(int i = 0 ; i <= 30 ; ++i) false];
List<bool> timeList = [for(int i = 0 ; i < 8 ; ++i) false];


class _timeSelectState extends State<timeSelect> {
  @override
  bool isSel = false;
  bool isSet = false;

  int date = 0;
  String _time = "";

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
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('예약을 원하는 날짜와 시간을 선택해주세요.',
                    style: TextStyle(color : Color(0xff141922), fontSize: 15, fontFamily: 'Gmarket',fontWeight: FontWeight.w500),),
                  SizedBox(height : 4),
                  Text('※ 담당 의료진의 진료스케줄에 따른 진료가 가능한 시간입니다.',
                    style: TextStyle(color : Color(0xffff5b64), fontSize: 10, fontFamily: 'Apple',fontWeight: FontWeight.w400),),
                  SizedBox(height : 16),
                  Container(width : MediaQuery.of(context).size.width,
                  height : 238,
                  child : Calender()),
                  SizedBox(height : 15),

                ],
              ),
            ),
            Container(width : MediaQuery.of(context).size.width, height : 6, decoration: BoxDecoration(color: Color(0xfff4f4f4)),),
            isSel ? Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('오전 예약 가능한 시간',
                    style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontFamily: 'Gmarket',fontWeight: FontWeight.w500),),
                  SizedBox(height : 14),
                  Row(
                    children: [
                      TimeSelecter(0, "10:00"),
                      TimeSelecter(1, "10:30"),
                      TimeSelecter(2, "11:30"),
                    ],
                  ),
                  SizedBox(height : 27),
                  Text('오후 예약 가능한 시간',
                    style: TextStyle(color : Color(0xff3d3d3d), fontSize: 13, fontFamily: 'Gmarket',fontWeight: FontWeight.w500),),
                  SizedBox(height : 14),
                  Container(
                    width : MediaQuery.of(context).size.width,
                    height : 36,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        TimeSelecter(3, "14:00"),
                        TimeSelecter(4, "15:30"),
                        TimeSelecter(5, "16:00"),
                        TimeSelecter(6, "17:00"),
                        TimeSelecter(7, "17:30"),
                      ],
                    ),
                  )
                ],
              ),
            ) : Container(),
            Expanded(child : Container()),
            Align(
              alignment: Alignment.bottomCenter,
              child: isSet ? GestureDetector(
                onTap : () => Get.to(request(), arguments: [date, _time]),
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
        )
    );
  }
  Widget Calender() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right :23.0),
              child: GestureDetector(
                child : Icon(Icons.arrow_back_ios, size : 10)
              ),
            ),
            Text("10월", style: TextStyle(color: Color(0xff141922),
                fontSize: 22,
                fontFamily: 'Gmarket',
                fontWeight: FontWeight.w500),),
            Padding(
              padding: const EdgeInsets.only(left : 23.0),
              child: GestureDetector(
                  child : Icon(Icons.arrow_forward_ios, size : 10)
              ),
            ),
          ],
        ),
        SizedBox(height : 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('일', style: TextStyle(color : Color(0xfff37981), fontSize: 12, fontWeight: FontWeight.w400),),
            Text('월', style: TextStyle(color : Color(0xff929292), fontSize: 12, fontWeight: FontWeight.w400),),
            Text('화', style: TextStyle(color : Color(0xff929292), fontSize: 12, fontWeight: FontWeight.w400),),
            Text('수', style: TextStyle(color : Color(0xff929292), fontSize: 12, fontWeight: FontWeight.w400),),
            Text('목', style: TextStyle(color : Color(0xff929292), fontSize: 12, fontWeight: FontWeight.w400),),
            Text('금', style: TextStyle(color : Color(0xff929292), fontSize: 12, fontWeight: FontWeight.w400),),
            Text('토', style: TextStyle(color : Color(0xff6691ff), fontSize: 12, fontWeight: FontWeight.w400),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UnClick('26'),
            UnClick('27'),
            UnClick('28'),
            UnClick('29'),
            UnClick('30'),
            UnClick(' 1 '),
            UnClick(' 2 '),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UnClick(' 3 '),
            UnClick(' 4 '),
            UnClick(' 5 '),
            UnClick(' 6 '),
            UnClick(' 7 '),
            UnClick(' 8 '),
            UnClick(' 9 '),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UnClick('10'),
            UnClick('11'),
            UnClick('12'),
            Click('13'),
            Click('14'),
            UnClick('15'),
            UnClick('16'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UnClick('17'),
            Click('18'),
            UnClick('19'),
            Click('20'),
            Click('21'),
            Click('22'),
            UnClick('23'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UnClick('24'),
            Click('25'),
            Click('26'),
            Click('27'),
            Click('28'),
            Click('29'),
            Click('30'),
          ],
        ),


      ],
    );
  }

  Widget TimeSelecter(int idx , String time){
    return Padding(
      padding: EdgeInsets.all(3.5),
      child : timeList[idx] ? GestureDetector(
      onTap :(){
        setState((){
          timeList[idx] = false;
          isSet =false;
          _time = time;
        });
      },
      child: Container(
        width : 73, height : 29,
        decoration: BoxDecoration(color : Color(0xffebf0ff), borderRadius: BorderRadius.circular(10), border: Border.all(color:Color(0xff4271ff))),
        child : Center(child: Text(time, style: TextStyle(color : Color(0xff141922),fontSize: 13 ,fontWeight: FontWeight.w400),)) ),
    )
    :
    GestureDetector(
      onTap :(){
        setState((){
          for(int i = 0 ; i < timeList.length ; i++)
            timeList[i] = false;
          timeList[idx] = true;
          isSet =true;
        });
      },
      child: Container(
          width : 73, height : 29,
          decoration: BoxDecoration(color : Colors.white54, borderRadius: BorderRadius.circular(10), border: Border.all(color:Color(0xffdadada))),
          child : Center(child: Text(time, style: TextStyle(color : Color(0xff141922),fontSize: 13 ,fontWeight: FontWeight.w400),)) ),
    ));


  }

  Widget UnClick(String text){
    return GestureDetector(
        child : Container(
            width : 31, height : 31,
            child : Center(
              child : Text(text, style: TextStyle(color : Color(0xff929292), fontSize: 14, fontWeight: FontWeight.w400),),)
        )
    );
  }

  Widget Click(String text){
    return GestureDetector(
      onTap : (){
        setState(() {
          selectList[int.parse(text)] = selectList[int.parse(text)] ? false : true;
          for(int i = 0 ; i < selectList.length ; i++) {
            if (int.parse(text) == i) continue;
            selectList[i] = false;
          }
          isSel = selectList[int.parse(text)];
          date = int.parse(text);
        });
      },
      child : Container(
        width : 31, height : 31,
        decoration : selectList[int.parse(text)] ? BoxDecoration(color : Color(0xffebf0ff), borderRadius: BorderRadius.circular(30), border : Border.all(color : Color(0xff4271ff))):null,
        child : Center(
          child : Text(text, style: TextStyle(color : Color(0xff141922), fontSize: 14, fontWeight: FontWeight.w400),),)
      )
    );
  }
}

