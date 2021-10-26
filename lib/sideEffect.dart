
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'assets.dart';


List<bool> _idx = [false,false,false,false,false,false,false,false,false,false,false];
List<bool> _idx2 = [false,false,false,false,false];
List<String> name = ["두통","불면증","식욕부진","우울 및 불안","심장박동수 증가", "어지러움","구토","복통","입마름","기타 직접 입력"];
List<String> name2 = ["거슬리는 정도예요", '일하기 불편해요', '집중할 수 없어요', '매우 힘들어요', '아무것도 못하겠어요'];
var record = false;
double _value = 5;
int temp = 5;

class SideEff extends StatefulWidget {
  const SideEff({Key? key}) : super(key: key);

  @override
  _SideEffState createState() => _SideEffState();
}

class _SideEffState extends State<SideEff> {

  @override
  int x = Get.arguments == null ? -1 : Get.arguments;
  String hour = DateFormat('hh').format(DateTime.now());
  String min = DateFormat('mm').format(DateTime.now());
  String  symptom='';
  int level = 0;
  String desc = '';
  List<String> time = [];
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Center(child: Text("부작용 기록", style : TextStyle(fontSize: 14, color:Color(0xff141922)))),
          backgroundColor: Colors.white,
          elevation: 1,
          leading : IconButton(icon: Icon(Icons.close, color : Color(0xff141922)), onPressed: (){Get.back();}, ),
          actions: [IconButton(icon:Icon(Icons.close,color:Colors.white),onPressed: (){},)],
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 23),
                  Text("시간", style: TextStyle(fontFamily: 'Gmarket', fontSize: 15, color: Color(0xff3d3d3d),fontWeight: FontWeight.w500),),
                  SizedBox(height : 8),
                  Row(
                      children : [
                        Text(formatDate(DateTime.now(),[yyyy,".",mm,".",dd,"  ",hh,":",nn, am]), style: TextStyle( fontSize: 18, color:Color(0xffff5b64)    ),),
                        Expanded(child: Container()),
                        GestureDetector(
                            child:Row(
                              children: [
                                Text('시간변경', style : TextStyle(color : Color(0xff929292), fontSize: 13,)),
                                SizedBox(width : 7),
                                SizedBox(child: Center(child: Icon(Icons.arrow_forward_ios,size:13, color:Color(0xff929292)))),
                              ],
                            )
                        )
                      ]
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical : 12.0),
                    child: Divider(),
                  ),
                  Text("어떤 부작용이 나타났나요?", style: TextStyle(fontFamily: 'Gmarket', fontSize: 15, color: Color(0xff3d3d3d),fontWeight: FontWeight.w500), ),
                  SizedBox(height : 15),
                  Container(
                    height : 280,
                    child: GridView.builder(
                        itemCount : name.length,
                        gridDelegate : SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing : 8,
                          childAspectRatio: 158/48,
                        ),
                        itemBuilder: (BuildContext context, int i){
                          return Buttons(name[i], i);
                        }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical : 12.0),
                    child: Divider(),
                  ),
                  Text("부작용이 얼마나 심하게 느껴지나요?", style: TextStyle(fontFamily: 'Gmarket', fontSize: 15, color: Color(0xff3d3d3d),fontWeight: FontWeight.w500), ),
                  SizedBox(height : 30),
                  Container(
                    width : MediaQuery.of(context).size.width,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Color(0xffcddeff),
                        inactiveTrackColor: Color(0xffcddeff),
                        trackShape: RoundedRectSliderTrackShape(),
                        trackHeight: 4.0,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        thumbColor: Color(0xff4271ff),
                        tickMarkShape: RoundSliderTickMarkShape(),
                        activeTickMarkColor: Color(0xffcddeff),
                        inactiveTickMarkColor: Color(0xffcddeff),
                        valueIndicatorColor: Colors.white,
                        valueIndicatorTextStyle: TextStyle(
                          color: Color(0xff4271ff),
                        ),
                      ),child : Slider(
                      value: _value,
                      min: 0.0,
                      max: 10.0,
                      divisions: 10,

                      label: '$temp',
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          temp = _value.toInt();
                          level = temp;

                        },
                        );
                      },
                    ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width : 20),
                      Text("0",style: TextStyle(color:Color(0xffcddeff)),),
                      Expanded(child : Container()),
                      Text("10",style: TextStyle(color:Color(0xffcddeff)),),
                      SizedBox(width : 20),
                    ],
                  ),

                  SizedBox(height: 15),
                  for(int i = 0 ; i < _idx2.length ; ++i) Buttons2(name2[i], i),
                  SizedBox(height : 45),
                  Center(
                    child: Text('정확한 부작용 기록으로 잊기 쉬운 증상을 전달하고\n비대면 진료시 약물 조절에 도움을 받으세요:)',
                        textAlign: TextAlign.center
                        ,style:TextStyle(color:Color(0xffb8b8b8),fontSize: 11,fontWeight: FontWeight.w200)),
                  ),



                  SizedBox(height : 30),
                  SizedBox(width : 324, height : 48,
                      child: record ?  ElevatedButton(
                          onPressed: (){},
                          child: Text("기록하기", style: TextStyle(color: Color(0xffb8b8b8)),),
                          style : ElevatedButton.styleFrom(
                              elevation : 0,
                              primary : Color(0xfff6f8ff),
                              shape : RoundedRectangleBorder(
                                borderRadius : BorderRadius.circular(10),
                              )
                          )
                      ) : ElevatedButton(
                          onPressed: (){
                            x < 0 ? sides.add(
                              side(name : this.symptom, level : this.level, desc : this.desc, time : [hour,min]),
                            ) : sides[x] =  side(name : this.symptom, level : this.level, desc : this.desc, time : [hour,min]);

                            Get.back();
                            Get.dialog(
                                Dialog()
                            );
                          },
                          child: Text("기록하기"),
                          style : ElevatedButton.styleFrom(
                              primary : Color(0xff4271ff),
                              shape : RoundedRectangleBorder(
                                borderRadius : BorderRadius.circular(10),
                              )
                          )
                      )
                  ),
                  SizedBox(height : 17,)
                ],
              ),
            ),
          )],
        )
    );
  }
  Widget Buttons(String text, int idx){
    return
      SizedBox(height : 48,width : 158,
          child : _idx[idx] ? TextButton(onPressed: (){
            setState((){
              buttonPressed(idx);
              record = false;
            });
          },
              style : TextButton.styleFrom(
                  backgroundColor: Color(0xffebf0ff),
                  side : BorderSide(color : Color(0xff4271ff), width : 0.7),
                  shape : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )
              ),
              child : Text(text, style: TextStyle(fontSize: 13, color: Color(0xff6b6b6b)),))
              :TextButton(onPressed: (){
            setState(() {
              buttonPressed(idx);
              _idx[idx] = true;
              record = false;
              symptom = text;
            });
          },
              style : TextButton.styleFrom(
                  primary: Colors.white,
                  side : BorderSide(color : Color(0xffdadada), width : 0.7),
                  shape : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )
              ),
              child : Text(text, style: TextStyle(fontSize: 13, color: Color(0xff6b6b6b)),)));
  }

  Widget Buttons2(String text, int idx){
    return
      Padding(
        padding: const EdgeInsets.only(bottom : 8.0),
        child: SizedBox(height : 48,width : 324,
            child : _idx2[idx] ? TextButton(onPressed: (){
              setState((){
                buttonPressed2(idx);
                record = false;
              });
            },
                style : TextButton.styleFrom(
                    backgroundColor: Color(0xffebf0ff),
                    side : BorderSide(color : Color(0xff4271ff), width : 0.7),
                    shape : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                ),
                child : Text(text, style: TextStyle(fontSize: 13, color: Color(0xff6b6b6b)),))
                :TextButton(onPressed: (){
              setState(() {
                buttonPressed2(idx);
                _idx2[idx] = true;
                record = false;
                desc = text;
              });
            },
                style : TextButton.styleFrom(
                    primary: Colors.white,
                    side : BorderSide(color : Color(0xffdadada), width : 0.7),
                    shape : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                ),
                child : Text(text, style: TextStyle(fontSize: 13, color: Color(0xff6b6b6b)),))),
      );
  }
  Widget Dialog(){
    return Stack(
        children: [
          Center(
              child: GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  height : 384,
                  width: 290,
                  child: Image.asset("assets/image/Record/부작용기록완료팝업.png"),


                ),
              )
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height : 275,
                ),
                GestureDetector(
                  onTap:(){
                    Get.back();
                  },
                  child: Container(
                    width : 290,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xff4271ff),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(
                        "확인",
                        style: TextStyle(color: Colors.white, fontSize: 14, decoration: TextDecoration.none),
                        textAlign: TextAlign.center,

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]
    );
  }

}


buttonPressed2(int idx){
  for(int i = 0 ; i < _idx2.length ; ++i)
    _idx2[i] = false;
  _idx2[idx] = _idx2[idx] ? false : true;
}

buttonPressed(int idx){
  for(int i = 0 ; i < _idx.length ; ++i)
    _idx[i] = false;
  _idx[idx] = _idx[idx] ? false : true;
}


