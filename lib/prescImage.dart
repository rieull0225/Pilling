
import 'package:date_format/date_format.dart';
import 'package:degree/assets.dart';
import 'package:degree/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class prescImage extends StatelessWidget {
  const prescImage({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
          actions: [IconButton(icon: Icon(Icons.share,), onPressed: () {
          }, color: Colors.black,),
            SizedBox(width : 40,child: Icon(Icons.file_download, color: Colors.black,)),
          ],
          title : Center(child: Text("실제 처방전", style:TextStyle(color : Colors.black),)),

          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Color(0xff141922),
            icon: Icon(Icons.close, size: 20,),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Image.asset('assets/image/Detail/prescription.png')
    );
  }
}

