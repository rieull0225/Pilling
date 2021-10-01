import 'package:degree/drugFail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class drug2 extends StatefulWidget {
  const drug2({Key? key}) : super(key: key);

  @override
  _drug2State createState() => _drug2State();
}

class _drug2State extends State<drug2> {

  var isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.arrow_back_ios,),onPressed: (){},color: Colors.white,)],
        title : Center(child : Text('아빌리파이정2mg', style: TextStyle(color : Color(0xff141922), fontSize: 14 ),)),
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
          Image.asset('assets/image/home/drug2.png'),
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
        cont("아리피프라졸 2mg"),
        div(),
        tit('성상'),
        SizedBox(height : 5),
        cont("녹색의 장방형 정제(각인 A-006 2)"),
        div(),
        tit("저장방법"),
        SizedBox(height : 5),
        cont('기밀용기, 실온(1~30℃)보관'),
        div(),
        tit("효능,효과"),
        SizedBox(height : 5),
        cont("환각 및 망상을 감소시키며 정신활동의 흥분상태를 제거함으로써 사회 적응을 도와주는 약.\n\n"
            "1. 조현병\n"
            "2.양극성 장애와 관련된 급성 조증 및 혼재 삽화의 치료 \n"
            "3.주요우울장애 치료의 부가요법제\n"
            "4.자폐장애와 관련된 과민증\n"
            "5.뚜렛장애"),
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
        cont("주요우울장애 치료의 부가요법제 - 성인\n\n"

        "기존의 항우울제를 복용하는 성인 환자에 대한 권장 초기용량은 식사와 관계없이 1일 1회 2~5mg 입니다. "
            "주요우울장애 치료의 부가요법제로서 이 약의 유효성은 1일 2~15mg에서 확립되었습니다."
            " 이 약은 1주일 이상의 간격으로 5mg 이하의 용량 범위에서 점진적으로 증량하여야 합니다.\n\n"

        "유지요법: 주요우울장애 치료의 부가요법에 대한 유지요법은 평가되지 않았습니다. 유지요법의 필요성을 결정하기 위해 환자는 정기적으로 재평가 되어야 합니다."),
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

