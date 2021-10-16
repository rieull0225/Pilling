
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'assets.dart';
import 'package:date_format/date_format.dart';

class sharedData extends StatefulWidget {
  const sharedData({Key? key}) : super(key: key);

  @override
  _sharedDataState createState() => _sharedDataState();
}

class _sharedDataState extends State<sharedData> {


  final control = Get.put(ReactiveController());
  int idx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.arrow_back_ios,),onPressed: (){Get.back();},color: Colors.white,)],
        title : Center(child : Text('공유데이터 미리보기', style: TextStyle(color : Color(0xff141922), fontSize: 14 ),)),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Color(0xff141922),
          icon: Icon(Icons.arrow_back_ios, size: 20),
          onPressed: (){Get.back();},
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width : MediaQuery.of(context).size.width, height : 51,
                child : Center(child : Text("2021년 10월 15일 ~ ${DateFormat('yyyy년 MM월 dd일').format(DateTime.now())}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),)
              ),
              Container(
                width : MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xfffafafa)),
                child : Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Align(
                        alignment : Alignment.topRight,
                        child : Text("최근 업데이트 : ${DateFormat('yyyy년 MM월 dd일(EE) hh:mmaaa').format(DateTime.now())}", style: TextStyle(fontSize: 11, color :Colors.grey, fontWeight: FontWeight.w200),),),
                      SizedBox(height : 9),
                      Container(width : MediaQuery.of(context).size.width,
                          height : 257,
                          child: Image.asset('assets/image/Detail/image1.png')),
                      SizedBox(height : 16),
                      Container(width : MediaQuery.of(context).size.width,
                          height : 321,
                          child: Image.asset('assets/image/Detail/drugFail.png')),
                      SizedBox(height : 16),
                      Container(width : MediaQuery.of(context).size.width,
                          height : 471,
                          child: Image.asset('assets/image/Detail/side.png')),
                      SizedBox(height : 16),
                      Container(width : MediaQuery.of(context).size.width,
                          height : 443,
                          child: Image.asset('assets/image/Detail/aver.png')),
                      SizedBox(height : 16),
                      Container(width : MediaQuery.of(context).size.width,
                          height : 494,
                          child: Image.asset('assets/image/Detail/graph.png')),

                    ],
                  ),
                )
              )
            ],
          )
        ],
      ),
    );
  }


}

