import 'package:degree/welcome.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dotted_line/dotted_line.dart';

List<Widget> s1 = [];
List<Widget> e1 = [];
List<Widget> s2 = [];
List<Widget> e2 = [];
List<Widget> s3 = [Container(width : 75, height : 101 ,child: Center(child: Text("AM", style : TextStyle(fontSize: 21,)))),
  Container(width : 75, height : 101 ,child: Center(child: Text("PM", style : TextStyle(fontSize: 21,))))];
List<Widget> e3 = [Container(width : 75, height : 101 ,child: Center(child: Text("AM", style : TextStyle(fontSize: 21,)))),
  Container(width : 75, height : 101 ,child: Center(child: Text("PM", style : TextStyle(fontSize: 21,))))];

List<Widget> ache = [];
List<bool> _idx = [false,false,false,false,false,false,false,false,false, false];
List<String> name = ['해당사항 없음', '두통', '불면중','식욕부진','우울 및 불안','심장박동수 증가','어지러움','구토','복통','입마름'];
List<bool> _idx2 = [false,false];
List<String> name2 = ["아니요, 없어요.", "네, 있어요"];
final controller = PageController(viewportFraction:1.0,
    initialPage: 0);

class additional extends StatefulWidget {
  const additional({Key? key}) : super(key: key);

  @override
  _additionalState createState() => _additionalState();
}

class _additionalState extends State<additional> {
  final PageController pageController = PageController(
    initialPage: 0,
  );



  _additionalState(){
    initList();
  }

  void initList(){
    if(s1.isEmpty) {
      for (int i = 1; i <= 12; ++i) {
        s1.add(Container(width : 75, height : 101 ,child: Center(child: Text("${i}", style : TextStyle(fontSize: 16,)))));
        e1.add(Container(width : 75, height : 101 ,child: Center(child: Text("${i}",style : TextStyle(fontSize: 16,)))));
      }
      for (int i = 0; i < 60; ++i) {
        s2.add(Container(width : 75, height : 101 ,child: Center(child: Text("${i}",style : TextStyle(fontSize: 16,)))));
        e2.add(Container(width : 75, height : 101,child: Center(child: Text("${i}",style : TextStyle(fontSize: 16,)))));
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar : AppBar(
          elevation : 0,
          backgroundColor: Colors.white,
          leading : IconButton(icon : Icon(Icons.arrow_back_ios,color : Colors.black), onPressed: (){
            if(pageController.page == 0){
              Get.back();
            }else {
              pageController.animateToPage(1,duration : Duration(milliseconds: 500), curve : Curves.easeInBack);
            };
          },)
        ),
        body : Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                height : MediaQuery.of(context).size.height - 100,
                child: PageView(
                  controller : pageController,
                  physics:new NeverScrollableScrollPhysics(),
                  children: [
                    First(pageController),
                    Second(pageController,s1,s2,e1,e2,s3,e3),
                    Third(pageController, ache),
                    Forth(pageController),
                  ]
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Column First(PageController pageController){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: SizedBox(width : 332 * 4/3, height : 52, child : Image.asset("assets/image/general/추가정보입력_네비게이터1.png")),
          ),
          SizedBox(height : 35 ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(width : 324,child: Text("현재 이로사님의 키와\n몸무게는 어떻게 되시나요?", style : TextStyle(fontSize: 22, fontWeight: FontWeight.w600,fontFamily: 'Gmarket', color : Color(0xff141922)))),
          ),
          SizedBox(height : 9),
          Text("신체 정보를 알면 약효와 부작용을 파악하는데 도움이 돼요", style : TextStyle(fontSize: 13, color : Color(0xff929292), fontWeight: FontWeight.w400)),
          SizedBox(height : 38 ,),
          Container(width : 324, height : 79 , decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border : Border.all(color : Color(0xff4271ff)),
            color : Colors.white,
          ),
              child : Padding(
                padding: const EdgeInsets.symmetric(horizontal : 18.0),
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal:true),
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]+'))],
                  textAlign: TextAlign.end,
                  style : TextStyle(fontSize : 28, color : Colors.black),
                  decoration: InputDecoration(border : InputBorder.none, labelText : "키",
                      labelStyle: TextStyle(fontSize: 14),
                      suffix : Text(" cm", style:TextStyle(fontSize: 24, color:Colors.black))),
                ),
              )),
          SizedBox(height : 10),
          Container(width : 324, height : 79 , decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border : Border.all(color : Color(0xff4271ff)),
            color : Colors.white,
          ),
              child : Padding(
                padding: const EdgeInsets.symmetric(horizontal : 24.0),
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal:true),
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]+'))],
                  textAlign: TextAlign.end,
                  style : TextStyle(fontSize : 28, color : Colors.black),
                  decoration: InputDecoration(border : InputBorder.none, labelText : "몸무게",
                      labelStyle: TextStyle(fontSize: 14),
                      suffix : Text(" kg", style:TextStyle(fontSize: 24, color:Colors.black))),
                ),
              )),

          Expanded(child : Container()),
          SizedBox(width : 324 , height : 48 ,
              child: ElevatedButton(
                  style : ElevatedButton.styleFrom(
                      shape : RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                      primary: Color(0xff4271ff),
                      onPrimary: Color(0xffffffff),
                      padding : EdgeInsets.zero
                  ),
                  onPressed: (){
                    pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  }, child: Text("다음", style: TextStyle(color : Color(0xffffffff),fontSize: 14,fontFamily: 'Gmarket',),textAlign: TextAlign.center,))),
          SizedBox(height : 17 )
        ]
    );
  }

  Column Second(PageController pageController, List<Widget> s1, List<Widget> s2, List<Widget> e1, List<Widget> e2,List<Widget> s3, List<Widget> e3){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(width : 332 * 4/ 3, height : 52, child : Image.asset("assets/image/general/추가정보입력_네비게이터2.png")),
          SizedBox(height : 35 ),
          Padding(
            padding: const EdgeInsets.only(left : 18.0),
            child: Text("평소 기상시간과\n취침시간을 알려주세요!", style : TextStyle(fontSize: 22, fontWeight: FontWeight.w600,fontFamily: 'Gmarket', color : Color(0xff141922))),
          ),
          SizedBox(height : 9),
          Padding(
            padding: const EdgeInsets.only(left : 18.0),
            child: Text("약물 복용 시간과 수면 장애를 분석하기 위한 정보에요.", style : TextStyle(fontSize: 13, color : Color(0xff929292), fontWeight: FontWeight.w400)),
          ),
          SizedBox(height : 38 ),
          Padding(
            padding: const EdgeInsets.only(left :18.0),
            child: Container(width : 324, height : 152 , decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border : Border.all(color : Color(0xff4271ff)),
              color : Colors.white,
            ),
                child : Padding(
                    padding: const EdgeInsets.symmetric(horizontal : 24.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[

                          Padding(
                            padding: const EdgeInsets.only(top:10.0),
                            child: Text('기상시간', style : TextStyle(color : Color(0xff4271ff), fontSize: 13),textAlign: TextAlign.left,),
                          ),
                          SizedBox(height : 7),
                          Stack(
                            children: [
                              Column(
                                children: [
                                  SizedBox(height : 42),
                                  Container(
                                      width : 303, height : 30, decoration : BoxDecoration(borderRadius : BorderRadius.circular(5), color : Color(0xffebf0ff))
                                  ),
                                ],
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children : [
                                    Container(height : 113 , width : 75,
                                      child: ListWheelScrollView(
                                        squeeze : 0.5,
                                        children : s1,
                                        itemExtent: 24,
                                      ),
                                    ),
                                    Container(
                                      height : 87,
                                      child: DottedLine(
                                        direction : Axis.vertical,
                                      ),
                                    ),
                                    Container(height : 113, width :75,
                                      child: ListWheelScrollView(
                                        squeeze : 1,
                                        children : s2,
                                        itemExtent: 60,
                                      ),
                                    ),
                                    Container(
                                      height : 87,
                                      child: DottedLine(
                                        direction : Axis.vertical,
                                      ),
                                    ),
                                    Container(height : 113, width :75,
                                      child: ListWheelScrollView(
                                        squeeze : 1,
                                        children : s3,
                                        itemExtent: 2,
                                      ),
                                    ),
                                  ]


                              ),
                            ],
                          )
                        ]
                    )
                )),
          ),
          SizedBox(height : 10),
          Padding(
            padding: const EdgeInsets.only(left : 18.0),
            child: Container(width : 324, height : 152 , decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border : Border.all(color : Color(0xff4271ff)),
              color : Colors.white,
            ),
                child : Padding(
                    padding: const EdgeInsets.symmetric(horizontal : 24.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[

                          Padding(
                            padding: const EdgeInsets.only(top:10.0),
                            child: Text('취침시간', style : TextStyle(color : Color(0xff4271ff), fontSize: 13),textAlign: TextAlign.left,),
                          ),
                          SizedBox(height : 7),
                          Stack(
                            children: [
                              Column(
                                children: [
                                  SizedBox(height : 42),
                                  Container(
                                      width : 303, height : 30, decoration : BoxDecoration(borderRadius : BorderRadius.circular(5), color : Color(0xffebf0ff))
                                  ),
                                ],
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children : [
                                    Container(height : 113, width :75,
                                      child: ListWheelScrollView(
                                        squeeze : 0.5,
                                        children : s1,
                                        itemExtent: 24,
                                      ),
                                    ),
                                    Container(
                                      height : 87,
                                      child: DottedLine(
                                        direction : Axis.vertical,
                                      ),
                                    ),
                                    Container(height : 113, width : 75,
                                      child: ListWheelScrollView(
                                        squeeze : 1,
                                        children : s2,
                                        itemExtent: 60,
                                      ),
                                    ),
                                    Container(
                                      height : 87,
                                      child: DottedLine(
                                        direction : Axis.vertical,
                                      ),
                                    ),
                                    Container(height : 113 , width : 75,
                                      child: ListWheelScrollView(
                                        squeeze : 1,
                                        children : s3,
                                        itemExtent: 2,
                                      ),
                                    ),
                                  ]


                              ),
                            ],
                          )
                        ]
                    )
                )),
          ),

          Expanded(child : Container()),
          Padding(
            padding: const EdgeInsets.only(left : 18.0),
            child: Row(
              children: [
                Container(width : 104 , height : 48,
                    decoration: BoxDecoration(border: Border.all(color : Color(0xff6b6b6b)), borderRadius: BorderRadius.circular(15)),
                    child: ElevatedButton(
                        style : ElevatedButton.styleFrom(
                            shape : RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                            primary: Colors.white,
                            onPrimary: Colors.white,
                            padding : EdgeInsets.zero
                        ),
                        onPressed: (){
                          pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                        }, child: Text("이전", style: TextStyle(color : Color(0xff6b6b6b),fontSize: 14,fontFamily: 'Gmarket',),textAlign: TextAlign.center,))),
                SizedBox(width : 8 ,),
                SizedBox(width : 212 , height : 48 ,
                    child: ElevatedButton(
                        style : ElevatedButton.styleFrom(
                            shape : RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                            primary: Color(0xff4271ff),
                            onPrimary: Color(0xffffffff),
                            padding : EdgeInsets.zero
                        ),
                        onPressed: (){
                          pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                        }, child: Text("다음", style: TextStyle(color : Color(0xffffffff),fontSize: 14,fontFamily: 'Gmarket',),textAlign: TextAlign.center,))),
              ],
            ),
          ),
          SizedBox(height : 17)
        ]
    );
  }

  Column Third(PageController pageController, List<Widget> ache){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              SizedBox(width : 320 , height : 52, child : Image.asset("assets/image/general/추가정보입력_네비게이터3.png")),
              SizedBox(width : 20),
            ],
          ),
          SizedBox(height : 35 ),
          Padding(
            padding: const EdgeInsets.only(left : 18.0),
            child: Text("약물 치료로 인해 불편함을\n겪고 있는 분야가 있으신가요?", style : TextStyle(fontSize: 22, fontWeight: FontWeight.w600,fontFamily: 'Gmarket', color : Color(0xff141922))),
          ),
          SizedBox(height : 9),
          Padding(
            padding: const EdgeInsets.only(left :18.0),
            child: Text("동반질환을 미리 파악하고 부작용을 예측하기 위한 정보에요.", style : TextStyle(fontSize: 12, color : Color(0xff929292), fontWeight: FontWeight.w400)),
          ),
          SizedBox(height : 38 ),
          Padding(
            padding: const EdgeInsets.only(left : 18.0),
            child: SizedBox(height : 324, width : 324,
              child : GridView.builder(
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
          ),




          Expanded(child : Container()),
          Padding(
            padding: const EdgeInsets.only(left : 18.0),
            child: Row(
              children: [
                Container(width : 104, height : 48 ,
                    decoration: BoxDecoration(border: Border.all(color : Color(0xff6b6b6b)), borderRadius: BorderRadius.circular(15)),
                    child: ElevatedButton(
                        style : ElevatedButton.styleFrom(
                            shape : RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                            primary: Colors.white,
                            onPrimary: Colors.white,
                            padding : EdgeInsets.zero
                        ),
                        onPressed: (){
                          pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                        }, child: Text("이전", style: TextStyle(color : Color(0xff6b6b6b),fontSize: 14,fontFamily: 'Gmarket',),textAlign: TextAlign.center,))),
                SizedBox(width : 8 ,),
                SizedBox(width : 212 , height : 48,
                    child: ElevatedButton(
                        style : ElevatedButton.styleFrom(
                            shape : RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                            primary: Color(0xff4271ff),
                            onPrimary: Color(0xffffffff),
                            padding : EdgeInsets.zero
                        ),
                        onPressed: (){
                          pageController.animateToPage(4, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                        }, child: Text("다음", style: TextStyle(color : Color(0xffffffff),fontSize: 14,fontFamily: 'Gmarket',),textAlign: TextAlign.center,))),
              ],
            ),
          ),
          SizedBox(height : 17 * 4/3)
        ]
    );
  }



  Column Forth(PageController pageController) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              SizedBox(width : 60 , height : 52, child : Image.asset("assets/image/general/추가정보입력_네비게이터4.png")),
              SizedBox(width : 250),
            ],
          ),
          SizedBox(height : 35 ),
          Padding(
            padding: const EdgeInsets.only(left:18.0),
            child: Text("ADHD 약 외에도\n복용 중인 약이 있으신가요?", style : TextStyle(fontSize: 22, fontWeight: FontWeight.w600,fontFamily: 'Gmarket', color : Color(0xff141922))),
          ),
          SizedBox(height : 9),
          Padding(
            padding: const EdgeInsets.only(left : 18.0),
            child: Text("처방되는 약과의 병용금기 유무를 파악하기 위한 정보에요.", style : TextStyle(fontSize: 12, color : Color(0xff929292), fontWeight: FontWeight.w400)),
          ),
          SizedBox(height : 38 ),

          for(int i = 0 ; i < name2.length ; ++i) Buttons2(name2[i],i),
          Expanded(child : Container()),
          Padding(
            padding: const EdgeInsets.only(left : 18.0),
            child: SizedBox(width : 324 , height : 48 ,
                child: ElevatedButton(
                    style : ElevatedButton.styleFrom(
                        shape : RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                        primary: Color(0xff4271ff),
                        onPrimary: Color(0xffffffff),
                        padding : EdgeInsets.zero
                    ),
                    onPressed: (){
                      Get.offAll(()=>welcome());
                    }, child: Text("완료", style: TextStyle(color : Color(0xffffffff),fontSize: 14,fontFamily: 'Gmarket',),textAlign: TextAlign.center,))),
          ),
          SizedBox(height : 17 )
        ]
    );
  }
  Widget Buttons(String text, int idx){
    return
      SizedBox(height : 48,width : 158,
          child : _idx[idx] ? TextButton(onPressed: (){
            setState((){
              buttonPressed(idx);
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
        padding: const EdgeInsets.fromLTRB(18,4,18,4),
        child: SizedBox(height : 48,width : 324,
            child : _idx2[idx] ? TextButton(onPressed: (){
              setState((){
                buttonPressed2(idx);
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


  buttonPressed(int idx){
    for(int i = 0 ; i < _idx.length ; ++i)
      _idx[i] = false;
    _idx[idx] = _idx[idx] ? false : true;
  }

  buttonPressed2(int idx){
    for(int i = 0 ; i < _idx2.length ; ++i)
      _idx2[i] = false;
    _idx2[idx] = _idx2[idx] ? false : true;
  }
}

