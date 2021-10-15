
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'home.dart';

final controller = PageController(viewportFraction:1.0,
    initialPage: 0);

class onBoarding extends StatefulWidget {
  @override
  _onBoardingState createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height : 120 ),
          SizedBox(
            height : 460,
            child: PageView(
              controller: controller,
              children: _onBoard,
            ),
          ),
          SizedBox(height : 15),
          Container( child : Padding(
            padding: const EdgeInsets.all(0.0),
            child: SmoothPageIndicator(controller:controller, count : 4,
                effect:SlideEffect(dotWidth: 6.88 , dotHeight: 6.88 ,spacing:8 ,dotColor: Color(0xffcddeff), activeDotColor: Color(0xff4271ff))),
          )),
          SizedBox(height : 34 ),
          SizedBox(width : 324 , height : 48 ,
              child: ElevatedButton(
                  style : ElevatedButton.styleFrom(
                    shape : RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                    primary: Color(0xff4271ff),
                    onPrimary: Color(0xffffffff),
                    padding : EdgeInsets.zero
                  ),
                  onPressed: (){
                    Get.offAll(MyHomePage());
                  }, child: Text("서비스 시작하기", style: TextStyle(color : Color(0xffffffff),fontSize: 14,),textAlign: TextAlign.center,))),
        SizedBox(height : 16)
        ],
      ),
    );
  }
}

@override
List<Column> _onBoard = [
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      GestureDetector(onTap:(){
        Get.to(()=>Home());
      },
          child: SizedBox(width : 268 , height : 285 , child : Image.asset("assets/image/general/온보딩1.png"))),
      SizedBox(height : 52 ),
      SizedBox(width : 200 , height : 56 , child : Text("필잉! 나만을 위한\n복약 관리를 시작해요",
          textAlign: TextAlign.center,
          style:TextStyle(
              fontFamily: 'Gmarket',color:Color(0xff4271ff),fontSize: 21, fontWeight: FontWeight.bold,
          )
      )),

      SizedBox(height : 29 ),
      SizedBox(width : 329 , height : 38 , child : Text("매일 잊지 않고 복용하여 간편하게 체크하고\n나만의 건강한 복약 습관을 길러보아요",
      textAlign: TextAlign.center,
      style: TextStyle(color:Color(0xff6b6b6b), fontSize : 12,fontWeight: FontWeight.w300),)
      ),
    ]
  ),
  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(width : 285 , height : 268, child : Image.asset("assets/image/general/온보딩2.png")),
        SizedBox(height : 52 ),
        SizedBox(width : 220 , height : 56, child : Text("부작용을 예측하고\n빠른 기록을 도와줘요",
            textAlign: TextAlign.center,
            style:TextStyle(
              fontFamily: 'Gmarket',color:Color(0xff4271ff),fontSize: 22, fontWeight: FontWeight.bold,
            )
        )),
        SizedBox(height : 29),
        SizedBox(width : 350 , height : 38, child : Text("머신러닝 기술로 나타날 수 있는 부작용을\n예측해주고, 빠르게 기록할 수 있어요!",
          textAlign: TextAlign.center,
          style: TextStyle(color:Color(0xff6b6b6b), fontSize : 12,fontWeight: FontWeight.w300),)
        ),
      ]
  ),
  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(width : 220, height : 232 , child : Image.asset("assets/image/general/온보딩3.png")),
        SizedBox(height : 49 ),
        SizedBox(width : 250 , height : 56 , child : Text("진료 시 기록된 데이터를\n의사와 함께 공유해요",
            textAlign: TextAlign.center,
            style:TextStyle(
              fontFamily: 'Gmarket',color:Color(0xff4271ff),fontSize: 21, fontWeight: FontWeight.bold,
            )
        )),

        SizedBox(height : 29 ),
        SizedBox(width : 350 , height : 38, child : Text("정확하게 기억하기 어려웠던\n증상 및 부작용을 쉽게 전달해 보아요!",
          textAlign: TextAlign.center,
          style: TextStyle(color:Color(0xff6b6b6b), fontSize : 12,fontWeight: FontWeight.w300),)
        ),
      ]
  ),
  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(width : 220 , height : 232, child : Image.asset("assets/image/general/온보딩4.png")),
        SizedBox(height : 49 ),
        SizedBox(width : 276 , height : 56 , child : Text("정확하고 빠른 진료,\nAI 챗봇 \'Dr.Pill\'과 함께해요",
            textAlign: TextAlign.center,
            style:TextStyle(
              fontFamily: 'Gmarket',color:Color(0xff4271ff),fontSize: 22, fontWeight: FontWeight.bold,
            )
        )),

        SizedBox(height : 29 ),
        SizedBox(width : 324 , height : 38 , child : Text("나만의 적정용량을 찾았다면\n언제든 진단 받고 동일한 약물을 처방받아요!",
          textAlign: TextAlign.center,
          style: TextStyle(color:Color(0xff6b6b6b), fontSize : 12,fontWeight: FontWeight.w300),)
        ),


      ]
  ),


];
