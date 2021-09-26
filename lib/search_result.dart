import 'package:degree/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onBoarding.dart';
import 'package:flutter/services.dart';

class search_result extends StatelessWidget {
  search_result({Key? key}) : super(key: key);
  //['열린마음신경정신과의원', '김해린', '경기 시흥시 배곧3로 96 엠플러스 3층', '031-432-8383']
  var title = Get.arguments[0];
  var name = Get.arguments[1];
  var address = Get.arguments[2];
  var phone = Get.arguments[3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar( backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(icon: Image.asset("assets/image/general/back_button.png"), onPressed: (){Get.back();},),
        ),
      ),
      body : Stack(
        children: <Widget>[
          ListView(
            children : [
              SizedBox(width : MediaQuery.of(context).size.width,
              child : Column(
                children: [
                  SizedBox( height : 157.5,
                    child: Container(
                      color : Colors.white,
                      child : Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 30,0,0),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width : 240 , height : 29 , child : Text("${title}",style : TextStyle(fontSize : 22, fontFamily : 'Gmarket',color : Color(0xff4271ff),fontWeight : FontWeight.w500))),
                                SizedBox(height : 17 ),
                                SizedBox(width : 43 , height : 15 , child : Text("병원소개",style : TextStyle(fontSize : 11, fontFamily : 'Apple', color : Color(0xff929292)))),
                                SizedBox(height : 6),
                                SizedBox(width : 270 , height : 40, child : Text("안녕하세요. ${title}입니다.\n정성을 다해 환자분들의 정신건강을 책임집니다.",
                                    style : TextStyle(fontSize : 14, fontFamily : 'Apple', color : Color(0xff3d3d3d)))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom:44.0),
                            child: SizedBox(width : 55 , height : 55 ,child: Image.asset("assets/image/general/병원검색_전화.png")),
                          )
                        ],
                      )
                    ),
                  ),
                  SizedBox(height : 7 ),

                ],
              ),
            ),
              SizedBox(width : MediaQuery.of(context).size.width,
                child :
                    SizedBox( height : 270,
                      child: Container(
                          color : Colors.white,
                          child : Padding(
                            padding: const EdgeInsets.fromLTRB(19.37 , 28.58, 0 ,0),
                            child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [SizedBox(child : Image.asset("assets/image/general/병원검색_의사정보.png"), width : 16  , height : 16 ),
                                          SizedBox(width : 5.38 ),
                                          Text('의사 정보',style : TextStyle(fontSize : 13, fontFamily : 'Gmarket',color : Color(0xff6b6b6b)))
                                        ],
                                      ),
                                      SizedBox(height : 17 ),
                                      SizedBox(height : 22 , width : 80 , child : Text("전문의 2명",style: TextStyle(fontSize : 16, color : Color(0xff3d3d3d), fontWeight: FontWeight.w700) )),
                                      SizedBox(height : 21 ),

                                      Padding(
                                        padding: const EdgeInsets.only(left : 16),
                                        child: Row(
                                          children :[
                                            Column(
                                              children:[
                                                Container(
                                                  width : 82 , height : 82 ,
                                                  decoration : BoxDecoration(
                                                    shape : BoxShape.circle,
                                                    image : DecorationImage(fit : BoxFit.fill, image : AssetImage("assets/image/general/심볼_blue.png")),
                                                  )
                                                ),
                                                SizedBox(height : 12),
                                                Text("${name} 의사", style : TextStyle(fontSize : 16, fontWeight: FontWeight.w700,color : Color(0xff3d3d3d))),
                                                SizedBox(height : 3 ),
                                                Text("정신건강의학과 7년차", style : TextStyle(fontSize: 11, fontWeight : FontWeight.w500, color : Color(0xff929292)))
                                              ]
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 36),
                                              child: Container(width : 1, color : Color(0xffebf0ff), height : 96),
                                            ),

                                            Column(
                                                children:[
                                                  Container(
                                                      width : 82, height : 82 ,
                                                      decoration : BoxDecoration(
                                                        shape : BoxShape.circle,
                                                        image : DecorationImage(fit : BoxFit.fill, image : AssetImage("assets/image/general/심볼_blue.png")),
                                                      )
                                                  ),
                                                  SizedBox(height : 12),
                                                  Text("한나비 의사", style : TextStyle(fontSize : 16, fontWeight: FontWeight.w700,color : Color(0xff3d3d3d))),
                                                  SizedBox(height : 4 ),
                                                  Text("정신건강의학과 5년차", style : TextStyle(fontSize: 11, fontWeight : FontWeight.w500, color : Color(0xff929292)))
                                                ]
                                            )
                                          ]
                                        ),
                                      )


                                    ],
                                  ),
                          ),
                      ),
                    ),
              ),
              SizedBox(height : 7 ),
              SizedBox( height : 371 ,
                width : MediaQuery.of(context).size.width,
                child: Container(
                  color : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 25, 18,0),
                    child: Column(children: [
                      Row(children: [
                        SizedBox(width : 11 , height : 11 , child : Image.asset("assets/image/general/병원검색_진료시간.png")),
                        Text('  진료 시간',style : TextStyle(fontSize: 14, color :Color(0xff6b6b6b), fontFamily: 'Gmarket'))
                      ],),
                      SizedBox(height: 16 ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          decoration : BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color : Color(0xfff6f8ff),
                          ),
                          width : 325 ,
                          height : 283 ,
                          child :
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(22 , 14, 0, 13),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                          Text("월요일",style : TextStyle(fontSize : 13, color : Color(0xff3d3d3d),fontWeight: FontWeight.w600)),
                                          SizedBox(height : 3),
                                          Text("08:00 ~ 19:00",style : TextStyle(fontSize : 13, color : Color(0xff6b6b6b), )),
                                        ],
                                      ),
                                      SizedBox(width : 82 ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                          Text("화요일",style : TextStyle(fontSize : 13, color : Color(0xff3d3d3d),fontWeight: FontWeight.w600)),
                                          SizedBox(height : 3),
                                          Text("08:00 ~ 19:00",style : TextStyle(fontSize : 13, color : Color(0xff6b6b6b), )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(width : 300, height : 1, decoration: BoxDecoration(border : Border.all(color : Color(0xffdadada))),),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(22 , 14 , 0, 13 ),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                          Text("수요일",style : TextStyle(fontSize : 13, color : Color(0xff3d3d3d),fontWeight: FontWeight.w600)),
                                          SizedBox(height : 3),
                                          Text("08:00 ~ 19:00",style : TextStyle(fontSize : 13, color : Color(0xff6b6b6b), )),
                                        ],
                                      ),
                                      SizedBox(width : 82 ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                          Text("목요일",style : TextStyle(fontSize : 13, color : Color(0xff3d3d3d),fontWeight: FontWeight.w600)),
                                          SizedBox(height : 3),
                                          Text("08:00 ~ 19:00",style : TextStyle(fontSize : 13, color : Color(0xff6b6b6b), )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(width : 300, height : 1, decoration: BoxDecoration(border : Border.all(color : Color(0xffdadada))),),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(22 , 14 , 0, 13 ),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                          Text("금요일",style : TextStyle(fontSize : 13, color : Color(0xff3d3d3d),fontWeight: FontWeight.w600)),
                                          SizedBox(height : 3),
                                          Text("08:00 ~ 19:00",style : TextStyle(fontSize : 13, color : Color(0xff6b6b6b), )),
                                        ],
                                      ),
                                      SizedBox(width : 82 ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                          Text("점심시간",style : TextStyle(fontSize : 13, color : Color(0xff3d3d3d),fontWeight: FontWeight.w600)),
                                          SizedBox(height : 3),
                                          Text("12:00 ~ 14:00",style : TextStyle(fontSize : 13, color : Color(0xff6b6b6b), )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(width : 300, height : 1, decoration: BoxDecoration(border : Border.all(color : Color(0xffdadada))),),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(22 , 14 , 0, 13),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                          Text("토요일",style : TextStyle(fontSize : 13, color : Color(0xff4271ff),fontWeight: FontWeight.w600)),
                                          SizedBox(height : 3),
                                          Text("08:00 ~ 19:00",style : TextStyle(fontSize : 13, color : Color(0xff6b6b6b), )),
                                        ],
                                      ),
                                      SizedBox(width : 82 ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                          Text("공휴일",style : TextStyle(fontSize : 13, color : Color(0xffff5b64),fontWeight: FontWeight.w600)),
                                          SizedBox(height : 3),
                                          Text("휴진",style : TextStyle(fontSize : 13, color : Color(0xff6b6b6b), )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                    ],),
                  ),
                ),
              ),

              SizedBox(height : 7 ),
              SizedBox( height : 292 ,
                width : MediaQuery.of(context).size.width,
                child: Container(
                  color : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 25 , 18,0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(children: [
                        SizedBox(width : 11 , height : 11 , child : Image.asset("assets/image/general/병원검색_위치.png")),
                        Text('  위치 정보',style : TextStyle(fontSize: 14, color :Color(0xff6b6b6b), fontFamily: 'Gmarket'))
                      ],),
                      SizedBox(height: 17 ),
                      Text('${address}', style : TextStyle(fontSize : 16, fontWeight: FontWeight.w500,color : Color(0xff3d3d3d))),
                        SizedBox(height : 14 ),
                        Container(width : 432, height : 161.54 , child : Image.asset("assets/image/general/병원검색_지도.png")),

                    ],),
                  ),
                ),
              ),
              SizedBox(height : 7 ),

              SizedBox( height : 235 ,
                width : MediaQuery.of(context).size.width,
                child: Container(
                  color : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 25 , 18,0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          SizedBox(width : 11 , height : 11 , child : Image.asset("assets/image/general/병원검색_연계약국.png")),
                          Text('  연계 약국',style : TextStyle(fontSize: 14, color :Color(0xff6b6b6b), fontFamily: 'Gmarket'))
                        ],),
                        SizedBox(height: 17 ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Text('한동 정신과의원 원내약국', style : TextStyle(fontSize : 16, fontWeight: FontWeight.w500,color : Color(0xff3d3d3d))),
                                SizedBox(height : 3, width : 282 ),
                                Text('경상북도 포항시 양덕동 72번길 한동빌딩 1층', style : TextStyle(fontSize : 12, fontWeight: FontWeight.w500, color :Color(0xff6b6b6b)),)
                              ]
                            ),
                            SizedBox(child : Image.asset("assets/image/general/병원검색_전화.png"), width : 36, height : 36),
                          ],
                        ),
                        SizedBox(height : 11),
                        Row(
                          children:[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children : [
                                Text('평일', style : TextStyle(fontSize: 12, color :Color(0xff141922),fontWeight: FontWeight.w300)),
                                SizedBox(height  : 1.3),
                                Text('08:00 ~ 19:00', style : TextStyle(fontSize: 12, color :Color(0xff6b6b6b),fontWeight: FontWeight.w300)),
                              ]
                            ),
                            SizedBox(width : 42),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children : [
                                  Text('토요일', style : TextStyle(fontSize: 12, color :Color(0xff141922),fontWeight: FontWeight.w300)),
                                  SizedBox(height  : 1.3),
                                  Text('08:00 ~ 21:00', style : TextStyle(fontSize: 12, color :Color(0xff6b6b6b),fontWeight: FontWeight.w300)),
                                ]
                            ),
                            SizedBox(width : 42),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children : [
                                  Text('공휴일', style : TextStyle(fontSize: 12, color :Color(0xfff37981),fontWeight: FontWeight.w300)),
                                  SizedBox(height  : 1.3),
                                  Text('휴무', style : TextStyle(fontSize: 12, color :Color(0xff6b6b6b),fontWeight: FontWeight.w300)),
                                ]
                            ),
                          ],
                        )


                      ],),
                  ),
                ),
              ),
            ]
          ),
          Padding(
            padding: const EdgeInsets.only(bottom : 17 ),
            child: Align(
                alignment : Alignment.bottomCenter,child: Container( width : 324, height : 48,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
                child: ElevatedButton(child : Text('병원 선택하기', style : TextStyle(fontSize : 13, fontWeight: FontWeight.w400)),
                    onPressed: (){Get.to(()=> SignIn());},
                    style : ElevatedButton.styleFrom(primary : Color(0xff4271ff),
                    shape : RoundedRectangleBorder(borderRadius : BorderRadius.circular(12),))))),
          ), // floatingbutton
        ],
      )
    );
  }
}
