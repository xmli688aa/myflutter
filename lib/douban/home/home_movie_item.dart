import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/dashed_line.dart';
import '../widgets/star_rating.dart';

class ETHomeMovieItem extends StatelessWidget {
  const ETHomeMovieItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(width: 10, color: Color(0xffee2e2e2))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1.电影排名
          getMoviRankWidget(),
          SizedBox(height: 12),
          // 2.具体内容
          getMovieContentWidget(),

          // 3.电影简介
          getMovieIntroduceWidget(),
        ],
      ),
    );
  }
  Widget getMoviRankWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(9, 4, 9, 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Color.fromARGB(255, 238, 205, 144),
      ),
      // width: 100,
      // height: 23,
      child: Text("No.1",style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36)),),
    );
  }
  Widget getMovieContentWidget(){
    return Container(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getCurrentImage(),
          SizedBox(width: 8,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getTitleWidget(),
              SizedBox(height: 8,),
              getRatingWidget(),
              SizedBox(height: 8,),
              getInfoWidget(),
            ],
          ),
        ),
          getDashLineWidget(),
          getContentWish(),//想看

        ],
      ),
    );
  }
  Widget getCurrentImage(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset("assets/images/headerIcon.jpg",),
    );
  }
  Widget getMovieIntroduceWidget(){
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xffe2e2e2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        "《肖申克的救赎》是由弗兰克·德拉邦特编剧并执导的美国剧情片，由蒂姆·罗宾斯、摩根·弗里曼领衔主演 [1]。\n该片改编自斯蒂芬·埃德温·金1982年的中篇小说《肖申克的救赎》，主要讲述了银行家安迪因被误判为枪杀妻子及其情人的罪名入狱后，他不动声色、步步为营地谋划自我拯救并最终成功越狱，重获自由的故事 [2]。该片于1994年9月10日在多伦多国际电影节首映，并于同年9月23日在美国部分地区公映。1995年，该片获得第67届奥斯卡金像奖中包括最佳影片在内的七项提名 [3]。"
      ,style: TextStyle(fontSize: 18, color: Colors.black54)),
    );
  }
  Widget getTitleWidget(){
    return const Text.rich(TextSpan(
      children:[
        WidgetSpan(child: Icon(Icons.play_circle_outline,color: Colors.red,),),
        TextSpan(
          text: "肖申克的救赎",
          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
        ),
        TextSpan(
            text: "（1994）",
            style: TextStyle(fontSize: 16,color: Colors.black54)
        ),
      ],
    )); 
  }
  Widget getRatingWidget(){
    return Row(
        children: [
          HYStarRating(rating: 9,size: 19,),
        ],
    );
  }
  Widget getInfoWidget(){
    return Text("蒂姆·罗宾斯、摩根·弗里曼、鲍勃·冈顿、威廉姆·赛德勒、克兰西·布朗、吉尔·贝罗斯、詹姆斯·惠特摩",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(

    ),);
  }
  Widget getDashLineWidget(){
    return Container(
      width: 1,height: 100,
        child: ETDashedLine(axis: Axis.vertical,dashedWidth: 1,count: 12,color: Colors.red,));
  }

  Widget getContentWish(){
    return Container(
      alignment: Alignment.center,
      width: 60,
      child: Column(
        children: [
          SizedBox(height: 20,),
          Icon(Icons.favorite,color: Colors.redAccent,),
          SizedBox(height: 8,),
          Text("想看",style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 235, 170, 60)),),
        ],
      ),
    );
  }

}
