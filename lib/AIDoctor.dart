import 'dart:async';
import 'package:degree/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AIDoctor extends StatefulWidget {
  const AIDoctor({Key? key}) : super(key: key);

  @override
  _AIDoctorState createState() => _AIDoctorState();
}


class ChatMessage{
  String messageContent;
  String messageType;
  List<String>? button;
  ChatMessage({required this.messageContent, required this.messageType, this.button});
}


class SenderMessage{
  String messageContent;
  List<String>? button;
  SenderMessage({required this.messageContent,this.button});
}



List<ChatMessage> messages = [
  ChatMessage(messageContent: "안녕하세요. 이로사님! AI 챗봇 닥터.Pill\n입니다. 그동안 잘 지내셨나요? 약에 대한 만족\n도가 높으셨나보군요:)지금부터 기록해주신\n복용 및 부작용 데이터 분석 결과를 함께\n보며 진료를 시작하도록 하겠습니다.",
      messageType: "receiver", button : ["네, 시작할게요", "다음에 다시 올게요."]),
];

String date = "20211110";
List<SenderMessage> messageSend = [
  SenderMessage(messageContent: "10월 23일부터 10월 30일까지 필잉노트에 기록\n된 데이터를 분석중입니다... 잠시만 기다려\n주세요..."),
  SenderMessage(messageContent:"주로 오후 3시에 식욕부진을 겪으셨네요. 가\n장 많이 느낀 부작용은 불면증으로 인한 수\n"
      "면부족으로 보여요. 다행스러운 건 이전 약\n물과 비교했을 때 식욕부진의 정도가 약 12%\n"
      " 낮아졌고, 이전에 나타난 우울 및 불안 또한\n약 72% 낮아졌어요.", button: ['분석 데이터 자세히 보기']),
  SenderMessage(messageContent: "이번 달에 새로 나타난 부작용으로 ‘체중 증\n"
      "가’를 입력해주셨는데, 이 부분은 아빌리파\n이정을 함께 복용하면 어쩔 수 없이 뒤따라\n"
      "오는 부작용으로, 필잉을 함께 이용하는 n명\n의 분들도 겪고 있는 증상이에요."),
  SenderMessage(messageContent:"현재 복용 중인 약물은 콘서타 27mg과 아빌\n"
      "리파이정 2mg이네요. 밤 시간대에 우울 및\n불안을 자주 기록해주셨는데, 관련 부작용을\n"
      "줄이기 위해 아빌리파이정을 2mg에서 5mg\n으로 늘려보시는 건 어떨까요?", button: ['유지할래요.', '변경할래요.']),
  SenderMessage(messageContent: "그럼 이전 약물과 동일한 콘서타 27mg과 아\n"
      "빌리파이정 2mg을 2주일치 처방해드릴게\n요."
      " 이번에도 꾸준히 복용하시면서 필잉노트\n에 기록하시는거 잊지 마세요!",),
  SenderMessage(messageContent: "다음 예상 진료 날짜는 ${DateFormat("M월 dd일").format(DateTime.parse(date)).toString()} 입니다.\n 오늘도 좋은 하루 되세요:)",button: ['진료 끝내기'])
];




class _AIDoctorState extends State<AIDoctor> {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _controller = ScrollController();
  bool _isComposing = false;
  int _idx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xff4271ff),
      actions: [Icon(Icons.arrow_back_ios, color: Color(0xff4271ff),size :30),Icon(Icons.arrow_back_ios, color: Color(0xff4271ff),size :30)],
      title : Center(child: Text('AI 진료실', style : TextStyle(color : Colors.white, fontFamily: 'Apple', fontWeight: FontWeight.w400, fontSize: 14,))),
      leading: GestureDetector(onTap: (){Get.back();},
      child: SizedBox(child: Icon(Icons.arrow_back_ios, size :18)),),),
      backgroundColor: Color(0xfff8faff),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom:50.0),
            child: ListView.builder(
              controller: _controller,
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10,bottom: 10),
              itemBuilder: (context, index){
                return Column(
                  children:[ index== 0 ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child : Center(
                        child: Text(DateFormat('yyyy년 MM월 dd일 ').format(DateTime.now()).toString() + DateFormat('EEEE').format(DateTime.now()).toString(),
                        style : TextStyle( fontSize: 11, fontFamily: 'Apple', fontWeight: FontWeight.w400, color:Colors.white)),
                      ),
                      width : 133, height : 20,
                      decoration: BoxDecoration(color : Color(0xffb8b8b8), borderRadius: BorderRadius.circular(20),),
                    ),
                  ) : Container(),
                    messages[index].messageType == "receiver" ?
                  doctorMessage(index): clientMessage(index),
                  ]

                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 21,
                      width: 21,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color : Color(0xff4271ff)),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(child: Icon(Icons.add, color:  Color(0xff4271ff), size: 20, )),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: Container(
                      height : 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color : Color(0xfff8faff),
                        border : Border.all(color:Color(0xffa0b8ff))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left : 8.0),
                        child: TextField(
                          controller: _textEditingController,
                          decoration: InputDecoration(
                              border: InputBorder.none
                          ),
                          onChanged: (text){
                            setState(() {
                              _isComposing = text.length > 0;
                            });
                          },
                          onSubmitted: _isComposing ? _handleSubmitted : null,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  _isComposing ? FloatingActionButton(
                    onPressed: _isComposing ? () => _handleSubmitted(_textEditingController.text) : null,
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ) : Container(),
                ],


              ),
            ),
          ),

        ],
      ),
    );
  }
  void _handleSubmitted(String text){
    if(messages.length >= 10) {
      messages = [
        ChatMessage(
            messageContent: "안녕하세요. 이로사님! AI 챗봇 닥터.Pill\n입니다. 그동안 잘 지내셨나요? 약에 대한 만족\n도가 높으셨나보군요:)지금부터 기록해주신\n복용 및 부작용 데이터 분석 결과를 함께\n보며 진료를 시작하도록 하겠습니다.",
            messageType: "receiver", button: ["네, 시작할게요", "다음에 다시 올게요."]),
      ];
      Get.offAll(Home());
    }
    _textEditingController.clear();
    setState((){
      _isComposing = false;
    });
    ChatMessage message = ChatMessage(messageContent : text, messageType : "sender");
    setState((){
      if(message.messageContent != "진료 끝내기")messages.insert(messages.length,message);
      FocusScope.of(context).unfocus();
      while(true){
        ChatMessage sender = ChatMessage(messageContent : messageSend[_idx].messageContent, messageType: 'receiver', button :
        messageSend[_idx].button != null ? messageSend[_idx].button : null);
        messages.insert(messages.length,sender);
        if(messageSend[_idx++].button != null) break;
      }
    });
    Timer(
      Duration(milliseconds: 100),
        ()=>_controller.animateTo(
          _controller.position.maxScrollExtent,
          duration: Duration(milliseconds: 400),
          curve: Curves.fastOutSlowIn,
        ),
    );

  }

  Widget doctorMessage(int index){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width : 10),
        Container(width : 37, height : 37, child : index == 0 || messages[index-1].messageType == "sender" ? Image.asset('assets/image/AI/AI진료프로필.png') : null) ,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            index == 0 || messages[index-1].messageType == "sender" ? Padding(
              padding: const EdgeInsets.only(left : 14.0),
              child: Text("닥터.Pill", style: TextStyle(fontSize: 11, fontFamily: 'Gmarket', fontWeight: FontWeight.w500,color: Color(0xff6b6b6b)),),
            ) : Container(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 14,right:0,top: 5,bottom: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft :Radius.zero ,
                        topRight : Radius.circular(20)  ,
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Color(0xffe8ebf6),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(messages[index].messageContent, style: TextStyle(fontSize: 12, fontFamily: 'Apple', fontWeight: FontWeight.w400,
                            color : Color(0xff3d3d3d)),),
                        if (messages[index].button != null) SizedBox(height :13),

                        if (messages[index].button != null)
                          for(int i = 0 ; i < messages[index].button!.length; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical : 3.0),
                              child: GestureDetector(
                                onTap: ()=>_handleSubmitted(messages[index].button![i]),
                                child: Container(
                                  width : 165, height: 36,
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                                  child : Center(child: Text(messages[index].button![i], style: TextStyle(color : Color(0xff4271ff), fontSize: 12, fontFamily: 'Apple',
                                  fontWeight: FontWeight.w400),)),
                                ),
                              ),
                            )
                      ],
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left : 5,bottom : 5.0),
                  child: Text(DateFormat('h:mm aaa ').format(DateTime.now()).toString(), style: TextStyle(color : Color(0xff6b6b6b), fontSize: 10),),
                ),
              ],
            ),
          ],
        ),

      ],
    );
  }

  Widget clientMessage(int index){
    return Container(
      padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right : 5,bottom : 5.0),
            child: Text(DateFormat('h:mm aaa').format(DateTime.now()).toString(), style: TextStyle(color : Color(0xff6b6b6b), fontSize: 10),),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft : Radius.circular(20),
                topRight :  Radius.zero ,
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Color(0xffebf0ff),
            ),
            padding: EdgeInsets.all(16),
            child: Text(messages[index].messageContent, style: TextStyle(fontSize: 12, fontFamily: 'Apple', fontWeight: FontWeight.w400,
                color :Color(0xff4271ff)),),
          ),
        ],
      ),
    );
  }
}
