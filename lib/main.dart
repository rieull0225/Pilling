import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onBoarding.dart';
import 'package:flutter/services.dart';
import 'package:degree/search_result.dart';

bool _isFirst = true;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var activity;
    activity = _isFirst ? onBoarding() : MyHomePage();
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: activity,
      theme : ThemeData(fontFamily:'Apple', primaryColor: Color(0xff4271ff), accentColor: Color(0xffffffff)),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  var hospital = [['리마인드정신건강의학과의원', '이승엽', '서울 서초구 서초대로 3-4', '02-593-5619'],
  ['마인드닥터의원', '한치호', '울산 남구 삼산로 18', '052-260-7525'],
  ['굿마인드의원', '박정환', '울산광역시 남구 중앙로 164', '052-269-0167'],
  ['소은희 마인드피아', '소은희', '서울 강남구 언주로 201 209호', '02-3463-3505'],
  ['마인드케어의원', '서현주', '서울 강서구 공항대로 206 나인스퀘어 4층', '02-2602-7588'],
  ['마인드애플정신건강의학과 의원', '황성기', '대구 수성구 동대구로 311 애플타워 9층 902', '053-751-1919'],
  ['마인드필정신건강의학과의원', '박필상', '대구광역시 북구침산남로 136 동성빌딩 6층', '053-351-5566'],
  ['제이스 마인드 의원', '정영철', '경북 포항시 북구 중흥로 341 2층', '054-278-7240'],
  ['마음과 마음정신과의원', '박전근', '서울시 구로구 도림로 65 한정 빌딩 2층~3층', '02-856-4920'],
  ['마음누리정신건강의학과', '김민정', '서울 동작구 동작대로 7 산광빌딩 5층', '02-525-3337'],
  ['마음샘정신건강의학과', '김진규', '서울시 서초구 서초동 1673-1 인앤인빌딩 502', '02-522-6836'],
  ['소은희 마인드피아', '소은희', '서울 강남구 언주로 201 209호', '02-3463-3505'],
  ['마음숲정신건강의학과', '박철진', '대구광역시 수성구 신매동 231-1 5층', '053-791-2242'],
  ['마음연정신건강의학과의원', '서한규', '서울 서초구 방배로 111 근복빌딩 3층', '02-522-7575'],
  ['마음챙김정신건강의학과', '이정민', '서울시 관악구 신림로 350 서원프라자 4층', '02-534-8856'],
  ['서울탑마음클리닉', '오승민', '서울시 마포구 마포대로 68 아크로타워 4층', '02-6933-1800'],
    ['열린마음신경정신과의원', '김해린', '경기 시흥시 배곧3로 96 엠플러스 3층', '031-432-8383']];
  String input = '';
// 0 병원 1 주소 2 번호 3 의사
  List _buildList(BuildContext context, var hospital, String input){
    List<List<String> > searchResult = [];
    for(List<String> s in hospital){
      for(String str in s){
        if(str.contains(input))
          searchResult.add(s);
          break;
      }
    }
    return searchResult;
  }

  Widget _List(BuildContext context, List list){
    return ListView.builder(
      padding : EdgeInsets.only(top:8),
      itemCount : list.length,
      itemBuilder : (context, index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical:5.0),
          child: SizedBox(
            height : 91,
            width : 296 ,
            child: GestureDetector(
              onTap : (){
                Get.to(()=> search_result(), arguments: list[index]);
              },
              child: Card(
                margin : EdgeInsets.zero,
                shape : RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side : BorderSide(color : Colors.grey.withOpacity(0.2), ),),
                child : Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                  child: ListTile(
                    title : Text("${list[index][0]}", style : TextStyle(fontSize : 15, fontWeight: FontWeight.w500, color : Color(0xff141922)), ),
                    subtitle : Padding(
                      padding: const EdgeInsets.only(top : 8.0),
                      child: Text("${list[index][2]} \n ${list[index][3]}  |  ${list[index][1]}원장", style : TextStyle(fontSize : 11, fontWeight: FontWeight.w400, color: Color(0xff929292))),
                    ),
                    trailing : Padding(
                      padding: const EdgeInsets.only(top:0.0),
                      child: Icon(Icons.arrow_forward_ios, color: Theme.of(context).primaryColor),
                    ),
                  ),
                )
              ),
            ),
          ),
        );
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height : 63),
                SizedBox(
                  width: 92 ,
                  height: 105  ,
                  child : Image.asset('assets/image/기타/로고_세로형_white.png',fit : BoxFit.fill),
                ),
                SizedBox(height : 32 ),
                SizedBox(width : 342 * 4/3 , height : 44,
                child : Text("부작용 관리부터\n비대면 진료까지 한번에!", style: TextStyle(color:Color(0xfff6f8ff),
                    fontFamily : 'Gmarket',fontSize : 16,fontWeight: FontWeight.w500),textAlign: TextAlign.center,)),
                SizedBox(height : 39 ),
                SizedBox(height : 44 , width :  324,
                child : Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color : Colors.white,
                  boxShadow: [BoxShadow(color : Colors.black12.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset:Offset(0,3))]),
                  child: SizedBox(
                    width : 320 ,
                    child: Padding(
                      padding: const EdgeInsets.only(left : 15.0),
                      child: Center(
                        child: TextField(
                          controller: _controller,
                          style: TextStyle(fontSize:14, fontFamily: 'Apple', fontWeight: FontWeight.w300, color : Color(0xff3d3d3d)),
                          decoration : InputDecoration(

                              hintText:'병원 이름을 검색해주세요.',
                              hintStyle: TextStyle(color : Color(0xffb8b8b8),fontSize : 14,fontFamily: 'Apple',fontWeight: FontWeight.w300),
                              focusedBorder : InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder : InputBorder.none,
                              border : InputBorder.none,
                              fillColor: Colors.white,
                              suffixIcon: IconButton(onPressed:(){
                                setState((){
                                  input = _controller.text;
                                  FocusScope.of(context).requestFocus(FocusNode());
                                });
                              },icon: Icon(Icons.search, color : Theme.of(context).primaryColor)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ),
                input == '' ? Column(mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    SizedBox(height : 88 ),
                    SizedBox(height : 43, width : 226*4/3 ,
                    child : Text("현재 내원중인 병원을 검색 후 등록하여\n의료데이터를 서비스 내 자동으로 받아옵니다.", textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, fontFamily : 'Apple', color : Color(0xffcddeff),fontWeight: FontWeight.w300),)),
                    SizedBox(height : 193 ),
                    GestureDetector(
                      onTap:(){Get.defaultDialog(title: '팝업 메시지', middleText:'팝업 메시지');},
                        child : Center(
                          child: SizedBox(
                      width : 324, height : 18 ,
                      child: Center(child: Text('혹시 서비스 이용이 처음이신가요?',style : TextStyle(fontSize : 13, color : Color(0xffffffff),decoration:TextDecoration.underline,fontWeight: FontWeight.w300 ))), ),
                        ))
                ],) : SizedBox(child : Column( children:[
                  SizedBox(height : 24),
                  SizedBox(height : 361 , width : 340,
                      child : Container(
                      decoration : BoxDecoration(color : Colors.white,borderRadius: BorderRadius.only(topRight:Radius.circular(30), topLeft: Radius.circular(30),
                      )),
                      child : Padding(
                        padding: const EdgeInsets.symmetric(horizontal : 21 ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              SizedBox(height : 22 ),
                          Text('\'${input}\' 검색결과', style : TextStyle(fontSize : 14, fontFamily: 'Gmarket', color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500),),
                              Padding(
                                padding: const EdgeInsets.only(top:8),
                                child: Divider(color : Color(0xffa0b8ff), thickness : 2 ),
                              ),
                              SizedBox(
                                  height : 295 ,
                                  child: _List(context, _buildList(context, hospital, input)),
                              )],),
                      )),
                  )
                ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
