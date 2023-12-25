
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:my_app/03_dart中的异步操作/service/http_request.dart';
class NewsPage extends StatefulWidget {
  static const String routeName = "/NewsPage";

  const NewsPage({super.key});

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final List _list = [];
  int _page = 1;
  bool hasMore = true; //判断有没有数据
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //延迟1秒加载 显示loading框
    Future.delayed(const Duration(seconds: 1)).then((value){
      _getData();

    });

    //监听滚动条事件
    _scrollController.addListener(() {
      print(_scrollController.position.pixels); //获取滚动条下拉的距离
      print(_scrollController.position.maxScrollExtent); //获取整个页面的高度
      //根据滚动条下拉的距离 和整个页面的高度 来加载下页的数据
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 40) {
        _getData();
      }
    });
  }

  void _getData() async {
    if (hasMore) {
      var apiUrl =
          "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=$_page";
      var response = await HttpRequest.request(url: "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=$_page", params: {});
      // var response = await Dio().get(apiUrl);
      var res = json.decode(response)["result"];

      setState(() {
        if(_page== 1){
        //  表示第一次加载 清空数据
          _list.clear();
        }
        _list.addAll(res);  //拼接
        _page++;
      });
      //判断是否是最后一页
      if (res.length < 20) {
        setState(() {
          hasMore = false;
        });
      }
    }
  }

  //下拉刷新
  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {
      _page = 1;
      _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("新闻列表"),
      ),
      body: _list.isNotEmpty
          ? RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _list.length, //20
                itemBuilder: (context, index) {//19                  
                  if (index == _list.length-1) {   //列表渲染到最后一条的时候加一个圈圈
                    //拉到底
                     return Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("${_list[index]["title"]}",
                              maxLines: 1),
                        ),
                        const Divider(),
                        _getMoreWidget()
                      ],
                    );

                  } else {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("${_list[index]["title"]}",
                              maxLines: 1),
                        ),
                        const Divider()
                      ],
                    );
                  }
                },
              ))
          : _getMoreWidget(),
    );
  }

  //加载中的圈圈
  Widget _getMoreWidget() {

    if(hasMore){
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '加载中...',
                style: TextStyle(fontSize: 16.0),
              ),
              CircularProgressIndicator(
                strokeWidth: 1.0,
              )
            ],
          ),
        ),
      );
    }else{
       return const Center(
         child: Text("--我是有底线的--"),
       );
    }
  }
}
