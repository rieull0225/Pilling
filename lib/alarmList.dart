
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'assets.dart';
import 'package:date_format/date_format.dart';

import 'notification.dart';


class alarmList extends StatefulWidget {
  const alarmList({Key? key}) : super(key: key);

  @override
  _alarmListState createState() => _alarmListState();
}

class _alarmListState extends State<alarmList> {

  final control = Get.put(ReactiveController());
  int idx = 0;
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [IconButton(
          color: Color(0xff141922),
          icon: Icon(Icons.add, size: 20),
          onPressed: (){},
        ),],
        title : Center(child : Text('나의 필링 타임', style: TextStyle(color : Color(0xff141922), fontSize: 14 ),)),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Color(0xff141922),
          icon: Icon(Icons.arrow_back_ios, size: 20),
          onPressed: (){Get.back();},
        ),
      ),
      body: Container(
          width : MediaQuery.of(context).size.width, height : MediaQuery.of(context).size.height,
          child : Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18,24,18,0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width : 12, height : 12,
                          child : Image.asset("assets/image/home/icon.png"),
                        ),
                        SizedBox(width : 1),
                        Text("최근 업데이트 : ${DateFormat("yyyy.MM.dd(금) hh:mmaaa").format(DateTime.now()).toString()}", style : TextStyle(color : Color(0xff929292), fontSize: 10, fontWeight: FontWeight.w300)),
                      ],
                    ),
                    ]),
              ),
                    Column(
                      children:[
                    GestureDetector(
                        onTap:(){
                          Get.to(()=>notification());
                        }
                        ,child: SizedBox(width : 360,height : 160, child : Image.asset('assets/image/Record/alarm1.png'))),
                        SizedBox(width : 360,height : 160, child : Image.asset('assets/image/Record/alarm2.png')),
                  ],
                ),
              ]),

          )
      );
  }


}

