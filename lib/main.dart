import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onBoarding.dart';
import 'package:degree/search_result.dart';
import 'assets.dart';

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


  String input = '';
// 0 병원 1 주소 2 번호 3 의사
  List<inform> _buildList(BuildContext context, List<inform> hospital, String input){
    List<inform> searchResult = [];
    for(inform s in hospital){
      if(s.name.contains(input))
        searchResult.add(s);
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
                    title : Text("${list[index].name}", style : TextStyle(fontSize : 15, fontWeight: FontWeight.w500, color : Color(0xff141922)), ),
                    subtitle : Padding(
                      padding: const EdgeInsets.only(top : 8.0),
                      child: Text("${list[index].address} \n ${list[index].phone}  |  ${list[index].doctor[0]}원장", style : TextStyle(fontSize : 11, fontWeight: FontWeight.w400, color: Color(0xff929292))),
                    ),
                    trailing : Padding(
                      padding: const EdgeInsets.only(top:0.0),
                      child: Icon(Icons.arrow_forward_ios, color: Theme.of(context).primaryColor, size: 18,),
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
      backgroundColor: Color(0xff6180f1),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height : 63),
                SizedBox(
                  height: 80  ,
                  child : Image.asset('assets/image/general/로고_세로형_white.png',fit : BoxFit.fill),
                ),
                SizedBox(height : 57 ),
                SizedBox(width : 342 * 4/3 , height : 44,
                child : Text("부작용 관리부터\n비대면 진료까지 한번에!", style: TextStyle(color:Color(0xfff6f8ff),
                    fontFamily : 'Gmarket',fontSize : 16,fontWeight: FontWeight.w500, height : 1.3),textAlign: TextAlign.center,)),
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
                      child: Center(child: Text('혹시 서비스 이용이 처음이신가요?',style : TextStyle(fontSize : 11, color : Color(0xffffffff),decoration:TextDecoration.underline,fontWeight: FontWeight.w300 ))), ),
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
