
import 'package:degree/assets.dart';
import 'package:degree/inCalling.dart';
import 'package:degree/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class homeForth extends StatefulWidget {
  const homeForth({Key? key}) : super(key: key);

  @override
  _homeForthState createState() => _homeForthState();
}

class _homeForthState extends State<homeForth> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width : MediaQuery.of(context).size.width,
            height : MediaQuery.of(context).size.height,
            child: Image.asset("assets/image/Calling/전화수신화면.png")),
        Padding(
          padding: const EdgeInsets.fromLTRB(47,541,0,0),
          child: GestureDetector(
              onTap: (){
                Get.to(()=>inCalling());
              },
              child : Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
                width : 70,height : 70,
              )
          ),
        )
      ],
    );
  }
}

