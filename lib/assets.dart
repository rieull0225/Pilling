

class inform{
  String name;
  List<String>? doctor;
  String address;
  String phone;
  inform({required this.name,required this.doctor, required this.address, required this.phone });
}



List<inform> hospital = [
  //inform(name: '리마인드정신건강의학과의원', doctor:['이승엽'], address:'서울 서초구 서초대로 3-4', phone: '02-593-5619'),
  //inform(name:'마인드닥터의원', doctor: ['한치호'], address:'울산 남구 삼산로 18', phone:'052-260-7525'),
  //inform(name: '굿마인드의원', doctor:['박정환'], address:'울산광역시 남구 중앙로 164', phone:'052-269-0167'),
  //inform(name: '마인드케어의원', doctor: ['서현주'], address:'서울 강서구 공항대로 206 나인스퀘어 4층', phone: '02-2602-7588'),
  //inform(name:'마인드애플정신건강의학과 의원', doctor:['황성기'], address:'대구 수성구 동대구로 311 애플타워 9층 902', phone:'053-751-1919'),
  //inform(name:'마인드필정신건강의학과의원', doctor :['박필상'],address :  '대구광역시 북구침산남로 136 동성빌딩 6층', phone :'053-351-5566'),
  //inform(name: '제이스 마인드 의원',doctor : ['정영철'], address : '경북 포항시 북구 중흥로 341 2층', phone :'054-278-7240',),
  inform(name : '마음과 마음정신과의원', doctor : ['박전근', '강한규', '류연진'], address : '서울시 구로구 도림로 65 한정 빌딩 2층~3층',phone :  '02-856-4920',),
  inform(name: '마음누리정신건강의학과', doctor : ['김민정'], address : '서울 동작구 동작대로 7 산광빌딩 5층', phone :'02-525-3337'),
  inform(name : '마음샘정신건강의학과',doctor : ['김진규', '곽은진'], address : '서울시 서초구 서초동 1673-1 인앤인빌딩 502',phone : '02-522-6836'),
  //inform(name: '소은희 마인드피아', doctor : ['소은희'], address : '서울 강남구 언주로 201 209호',phone : '02-3463-3505'),
  inform(name:'마음숲정신건강의학과', doctor : ['박철진','최종인'], address :'대구광역시 수성구 신매동 231-1 5층', phone : '053-791-2242'),
  inform(name : '마음연정신건강의학과의원', doctor : ['서한규'],address : '서울 서초구 방배로 111 근복빌딩 3층', phone : '02-522-7575'),
  inform(name: '마음챙김정신건강의학과',doctor : ['이정민', '박진경'],address : '서울시 관악구 신림로 350 서원프라자 4층',phone: '02-534-8856'),
  inform(name: '서울탑마음클리닉',doctor: ['오승민'], address : '서울시 마포구 마포대로 68 아크로타워 4층', phone : '02-6933-1800'),
  inform(name : '열린마음신경정신과의원', doctor: ['김해린','윤민진','이현이'], address : '경기 시흥시 배곧3로 96 엠플러스 3층', phone : '031-432-8383'),
];