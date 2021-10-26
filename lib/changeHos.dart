
import 'dart:async';

import 'package:degree/reservation.dart';
import 'package:degree/search_result.dart';
import 'package:degree/search_result_after.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'assets.dart';


class changeHos extends StatefulWidget {
  const changeHos({Key? key}) : super(key: key);

  @override
  _changeHosState createState() => _changeHosState();
}



class _changeHosState extends State<changeHos> {
  bool isSelected = false;
  int idx = 0;
  List<bool> selectList = [];
  List<inform> secondList = [];

  String doctor = Information.doctor;
  String hos = Information.hospital;
  String phone = Information.phone;
  String address = Information.address;

  TextEditingController _controller = TextEditingController();

  String input = '';

  List<inform> _buildList(BuildContext context, List<inform> hospital, String input){
    List<inform> searchResult = [];
    for(inform s in hospital){
      if(s.name.contains(input))
        searchResult.add(s);
        secondList.add(s);
        selectList.add(false);
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
              child: selectList[index] ? GestureDetector(
                onTap:(){
                  setState(() {
                    selectList[index] = false;
                  });
                },
                child: Card(
                  color: Color(0xffebf0ff),
                    margin : EdgeInsets.zero,
                    shape : RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side : BorderSide(color : Color(0xff4271ff), ),),
                    child : Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: ListTile(
                        title : Text("${list[index].name}", style : TextStyle(fontSize : 15, fontWeight: FontWeight.w500, color : Color(0xff141922)), ),
                        subtitle : Padding(
                          padding: const EdgeInsets.only(top : 8.0),
                          child: Text("${list[index].address} \n ${list[index].phone}  |  ${list[index].doctor[0]}원장", style : TextStyle(fontSize : 11, fontWeight: FontWeight.w400, color: Color(0xff929292))),
                        ),
                        trailing : GestureDetector(
                          onTap : (){
                            Get.to(()=> search_result_after(), arguments: list[index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top:0.0, bottom : 3),
                            child: Icon(Icons.arrow_forward_ios, color: Color(0xff6b6b6b),),
                          ),
                        ),
                      ),
                    )
                ),
              ):GestureDetector(
                onTap: (){
                  setState((){
                    for(int i = 0 ; i < selectList.length; i++)
                      selectList[i]= false;
                    selectList[index] = true;
                    idx = index;
                    phone = list[index].phone;
                    doctor = list[index].doctor[0];
                    address = list[index].address;
                    hos = list[index].name;
                  });
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
                        trailing : GestureDetector(
                          onTap : (){
                            Get.to(()=> search_result_after(), arguments: list[index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top:0.0, bottom : 3),
                            child: Icon(Icons.arrow_forward_ios, color: Color(0xff6b6b6b),),
                          ),
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
        appBar: AppBar(
          actions: [IconButton(icon: Icon(Icons.close,),onPressed: (){Get.back();},color: Colors.white,)],
          title : Center(child : Text('병원 변경하기', style: TextStyle(color : Color(0xff141922), fontSize: 14 ),)),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Color(0xff141922),
            icon: Icon(Icons.close, size: 30,),
            onPressed: (){Get.back();},
          ),
        ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height :MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 24, 19,0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("변경을 원하는 병원을 검색 후 선택해주세요", style: TextStyle(color : Color(0xff141922), fontSize: 15, fontFamily: 'Gmarket', fontWeight: FontWeight.w500),),
                    SizedBox(height : 11),
                    Container(
                      width : 324, height: 39,
                      decoration:BoxDecoration(color: Color(0xfff4f4f4),
                      borderRadius: BorderRadius.circular(5)) ,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14.0),
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
                              },icon: Icon(Icons.search, color : Color(0xff929292))),
                            ),
                          ),
                        ),
                      ),
                    ),
                    input == ''? Container() : SizedBox(child : Column( children:[
                      Container(width : MediaQuery.of(context).size.width,
                        child : Container(
                            decoration : BoxDecoration(color : Colors.white,borderRadius: BorderRadius.only(topRight:Radius.circular(30), topLeft: Radius.circular(30),
                            )),
                            child : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                SizedBox(height : 22 ),
                                Text('\'${input}\' 검색결과', style : TextStyle(fontSize : 14 , color: Color(0xff141922), fontWeight: FontWeight.w400),),
                                Padding(
                                  padding: const EdgeInsets.only(top:8),
                                  child: Divider(color : Color(0xffb8b8b8), thickness : 1 ),
                                ),
                                SizedBox(
                                  height : MediaQuery.of(context).size.height - 315,
                                  child: _List(context, _buildList(context, hospital, input)),
                                ),
                                SizedBox(height : 41)
                              ],
                            )
                        ),
                      ),
                      SizedBox(height : 37)])),

                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width : MediaQuery.of(context).size.width,
                height : 78,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 6, offset: Offset(0,-4) )]
                ),
                child : Padding(
                  padding: const EdgeInsets.fromLTRB(18,13,18,17),
                  child: GestureDetector(
                    onTap: (){
                      Information = hosInfo(hospital : hos, doctor: doctor, address: address, phone: phone);
                      Get.dialog(Dialog());
                    },
                    child: Container(
                      child : Center(child: Text("병원 선택하기",style: TextStyle(color: Colors.white,fontSize: 14, fontWeight: FontWeight.w400),)),
                      width : 324, height : 48,
                      decoration: BoxDecoration(color : Color(0xff4271ff), borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
    );
  }

  Widget Dialog2(){
    return Stack(
        children: [
          Center(
              child: Container(
                height : 320,
                width: 289,
                child: Image.asset("assets/image/Booking/변경성공.png",fit: BoxFit.fill),
              )
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height : 280,
                ),
                GestureDetector(
                  onTap:(){
                    Get.back();
                  },
                  child: GestureDetector(
                    onTap:(){
                      print(secondList);
                      Get.to(reservation(),arguments: secondList[idx]);
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
                ),
              ],
            ),
          ),
        ]
    );;
  }

  Widget Dialog(){
    return Stack(
        children: [
          GestureDetector(
            onTap : (){
              Get.back();
              Get.dialog(Dialog2());
            },
            child: Center(
                child: Container(
                  height : 208,
                  width: 194,
                  child: Image.asset("assets/image/Booking/진료내역.png"),
                )
            ),
          ),
          /*Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height : 156,
                ),
                GestureDetector(
                  onTap:(){
                    Get.back();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width : 145,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Color(0xffdadada),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: Center(
                          child: Text(
                            "취소",
                            style: TextStyle(color: Color(0xff3d3d3d), fontSize: 14, decoration: TextDecoration.none),
                            textAlign: TextAlign.center,

                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          width : 145,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Color(0xff4271ff),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text(
                              "변경할래요",
                              style: TextStyle(color: Colors.white, fontSize: 14, decoration: TextDecoration.none),
                              textAlign: TextAlign.center,

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),*/
        ]
    );
  }


}

