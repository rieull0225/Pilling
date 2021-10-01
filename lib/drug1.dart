import 'package:degree/drugFail.dart';
import 'package:degree/drugOK.dart';
import 'package:degree/sideEffect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:get/get.dart';
import 'homeFirst.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';


class drug1 extends StatefulWidget {
  const drug1({Key? key}) : super(key: key);

  @override
  _drug1State createState() => _drug1State();
}

class _drug1State extends State<drug1> {
  var isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.arrow_back_ios,),onPressed: (){},color: Colors.white,)],
        title : Center(child : Text('콘서타OROS서방정27mg', style: TextStyle(color : Color(0xff141922), fontSize: 14 ),)),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Color(0xff141922),
          icon: Icon(Icons.arrow_back_ios, size: 16,),
          onPressed: (){Get.back();},
        ),
      ),
      body: Stack(
        children: [
          Image.asset('assets/image/home/drug1.png'),
          Column(
            children: [
              SizedBox(height : 158),
              Container(
                height : 474,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18,17,18,15),
                      child: Column(
                        children: [

                          isSelected ? SelectedRow() : UnSelectedRow(),
                          SizedBox(height : 27),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: isSelected ? Selected() : UnSelected(),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget div(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Divider(),
    );
  }

  Widget tit(String str){
    return Text(str, style: TextStyle(color: Color(0xff4271ff),fontWeight: FontWeight.w600, fontSize: 14),);
  }
  Widget cont(String str){
    return Text(str,style: TextStyle(color: Color(0xff3d3d3d),fontFamily: 'Apple', fontWeight: FontWeight.w100, fontSize: 13), );
  }


  Widget Selected(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tit("성분정보"),
        SizedBox(height : 5),
        cont("메틸페니데이트염산염 27mg"),
        div(),
        tit('성상'),
        SizedBox(height : 5),
        cont("회색의 장방형 필름코팅 정제"),
        div(),
        tit("저장방법"),
        SizedBox(height : 5),
        cont('15~30°C, 밀폐용기, 습기를 피해 보관'),
        div(),
        tit("효능,효과"),
        SizedBox(height : 5),
        cont("중추신경을 자극함으로써 주의력 결핍 과잉 행동장애, 우울\n증 및 수면장애 등의 질환을 치료하는 약.\n\n"
            "ADHD에 대한 이 약의 치료효과는 DSM-IV 기준에 부합하\n는 소아 및 청소년과 성인 ADHD환자를 대상으로 한 임상\n"
            "시험에서 입증되었다. \n\n"
            "이 약은 ADHD의 환자에 대한 다른 치료방법(심리적, 교육\n학적, 사회적)이 포함된 전체 치료프로그램 내 필수적인 부\n"
            "분으로 사용될 수 있다. 약물 치료는 이 증상을 가지고 있는\n모든 환자에게 필요한 것은 아니다. 이 약은 환경적인 요인\n"
            "및\/또는 다른 일차성 정신과 장애(정신이상 포함)에 이차적\n으로 수반되어 ADHD 증상을 나타내는 환자에는 적합하지\n"
            "않다. 적절한 교육을 통한 대체치료가 필수적이며 심리·사회학적 치료방법도 유익하다. 한가지의 치료방법으로 불충\n"
            "분한 경우에 이 약의 처방 여부를 결정하는 것은 환자 증상\n의 만성 정도와 중증도에 대한 의사의 평가에 따라 좌우될\n"
            "수 있다."),
        div(),
        Text("(출처)약학정보원",style: TextStyle(color: Color(0xffb8b8b8,),fontSize: 11,),),
        SizedBox(height : 50),
      ],
    );
  }




  Widget UnSelected(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tit("용법/용량"),
        SizedBox(height : 5),
        cont("1일 1회 오전에 경구 투여한다.\n"
            "이 약은 물과 함께 정제 그대로 복용해야 한다. 정제를 씹거\n"
            "나 자르거나 분쇄해서는 안된다. 이 약은 음식과 함께 복용\n"
            "하여도 무관하다."),
        div(),
        tit('복용시 주의사항'),
        SizedBox(height : 5),
        Image.asset('assets/image/home/warning.png'),
        SizedBox(height : 14),
        cont("1. 가능한 오전중에 투여하는 것이 좋으며, 늦은 저녁에"
            "   투여하는 것은 피하세요.\n"
            "2. 긴장, 흥분, 불면, 가슴두근거림 등이 나타나면 전문가"
            "   와 상의하세요.\n"
            "3. 갑자기 투여를 중단하면 증상이 악화되거나 부작용이"
            "   나타날 수 있으니 주의하세요.\n"
            "4. 장기간 투여할 경우 정신적, 신체적 의존성이 생길 수 있으니 주의하세요.\n"
            "5. 장기간 투여할 경우 소아는 정기적으로 체중과 신장을 측정하세요.\n"
            "6. 씹거나 부수지 말고 물과 함께 그대로 복용하세요."),
        div(),
        Text("(출처)약학정보원",style: TextStyle(color: Color(0xffb8b8b8,),fontSize: 11,),),
        SizedBox(height : 50),
      ],
    );
  }


  Widget SelectedRow(){
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
            border : Border.all(color: Color(0xff4271ff)),
            color: Color(0xff4271ff),
          ),
          width : 162, height : 32,
          child : Center(child: Text('의약품 상세정보',style: TextStyle(fontSize: 13,fontFamily: 'Gmarket',color: Colors.white),)),
        ),
        GestureDetector(
            onTap:(){
              setState(() {
                isSelected = false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                border : Border.all(color: Color(0xff4271ff)),
                color: Colors.white,
              ),
              width : 162, height : 32,
              child : Center(child: Text('복약안내',style: TextStyle(fontSize: 13,fontFamily: 'Gmarket',color: Color(0xff4271ff), fontWeight: FontWeight.normal,)),
              ),)
        ),
      ],
    );
  }

  Widget UnSelectedRow(){
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            setState(() {
              isSelected = true;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              border : Border.all(color: Color(0xff4271ff)),
              color: Colors.white,
            ),
            width : 162, height : 32,
            child : Center(child: Text('의약품 상세정보',style: TextStyle(fontSize: 13,fontFamily: 'Gmarket',color: Color(0xff4271ff)),)),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            border : Border.all(color: Color(0xff4271ff)),
            color: Color(0xff4271ff),
          ),
          width : 162, height : 32,
          child : Center(child: Text('복약안내',style: TextStyle(fontSize: 13,fontFamily: 'Gmarket',color: Colors.white),)),
        ),
      ],
    );
  }
}

