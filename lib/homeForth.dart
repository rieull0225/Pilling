
import 'package:degree/assets.dart';
import 'package:degree/inCalling.dart';
import 'package:degree/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:timer_builder/timer_builder.dart';



class homeForth extends StatefulWidget {
  const homeForth({Key? key}) : super(key: key);

  @override
  _homeForthState createState() => _homeForthState();
}

class _homeForthState extends State<homeForth> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width : MediaQuery.of(context).size.width,
      height : MediaQuery.of(context).size.height,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Image.asset("assets/image/home/mypage.png",))
      ),
    );
  }
}

