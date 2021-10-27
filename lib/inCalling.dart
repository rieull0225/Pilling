
import 'package:degree/callCompl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'assets.dart';


class inCalling extends StatefulWidget {
  const inCalling({Key? key}) : super(key: key);

  @override
  _inCallingState createState() => _inCallingState();
}

class _inCallingState extends State<inCalling> {
  @override
  final control = Get.put(ReactiveController());
  int idx = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Color(0xff15b76c)),
        actions: [IconButton(icon: Icon(Icons.arrow_back_ios,),onPressed: (){},color: Colors.white,)],
        title : Center(child : Text('··· 진료 중 ···', style: TextStyle(color : Color(0xff4271ff), fontSize: 18 , fontFamily: 'Gmarket', fontWeight: FontWeight.w700),)),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(children: [
              GestureDetector(
                  onTap:(){
                    Get.to(()=>callCompl());
                  },child: Image.asset('assets/image/Calling/profile.png')),
              SizedBox(height : 49),
              Image.asset('assets/image/Calling/image.png'),
            ],),
          )
        ],
      ),
    );
  }


}

