
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage();
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(       
        mainAxisAlignment: MainAxisAlignment.center,
        children: [                   
           
            SizedBox(height: 20),
             ElevatedButton(
              child: Text('跳转到上拉分页加载更多页面'),
              onPressed: (){
                  Navigator.pushNamed(context, '/news');
              },
            ),
            SizedBox(height: 20),  
        ],         
       
      ),
    );
  }
}
