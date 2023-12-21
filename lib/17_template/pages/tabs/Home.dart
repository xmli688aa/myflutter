
import 'package:flutter/material.dart';
import 'package:my_app/17_template/pages/01_%E4%B8%8B%E6%8B%89%E5%88%B7%E6%96%B0_%E4%B8%8A%E6%8B%89%E5%8A%A0%E8%BD%BD/News.dart';

class HomePage extends StatefulWidget {
  HomePage();
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(       
        mainAxisAlignment: MainAxisAlignment.start,
        children: [                   
           
            SizedBox(height: 20),
             ElevatedButton(
              child: Text('跳转到上拉分页加载更多页面'),
              onPressed: (){
                  Navigator.pushNamed(context, NewsPage.routeName);
              },
            ),
            SizedBox(height: 20),  
        ],         
       
      ),
    );
  }
}
