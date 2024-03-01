import 'package:flutter/material.dart';
import 'package:my_app/17_template/pages/tabs/home_drawer.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar的使用'),
      ),
      body: DefaultTabController(
        length: 8,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black26,
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: TabBar(
                      isScrollable: true,
                      //如果多个按钮的话可以滑动
                      indicatorColor: Colors.yellow,
                      labelColor: Colors.yellow,
                      unselectedLabelColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.label,

                      tabs: <Widget>[
                        Tab(text: "推荐0"),
                        Tab(text: "推荐1"),
                        Tab(text: "推荐2"),
                        Tab(text: "推荐3"),
                        Tab(text: "热销4"),
                        Tab(text: "推荐5"),
                        Tab(text: "推荐6"),
                        Tab(text: "推荐7")
                      ],
                    ),
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                ListView(
                  children: const <Widget>[
                    ListTile(title: Text("第一个tab")),
                    ListTile(title: Text("第一个tab")),
                    ListTile(title: Text("第一个tab"))
                  ],
                ),
                ListView(
                  children: const <Widget>[
                    ListTile(title: Text("第二个tab")),
                    ListTile(title: Text("第二个tab")),
                    ListTile(title: Text("第二个tab"))
                  ],
                ),
                ListView(
                  children: const <Widget>[
                    ListTile(title: Text("第三个tab")),
                    ListTile(title: Text("第三个tab")),
                  ],
                ),
                ListView(
                  children: const <Widget>[
                    ListTile(title: Text("第四个tab")),
                    ListTile(title: Text("第四个tab"))
                  ],
                ),
                ListView(
                  children: const <Widget>[
                    ListTile(title: Text("第五个tab")),
                    ListTile(title: Text("第五个tab")),
                  ],
                ),
                ListView(
                  children: const <Widget>[
                    ListTile(title: Text("第六个tab")),
                    ListTile(title: Text("第六个tab")),
                  ],
                ),
                ListView(
                  children: const <Widget>[
                    ListTile(title: Text("第七个tab")),
                    ListTile(title: Text("第七个tab"))
                  ],
                ),
                ListView(
                  children: const <Widget>[
                    ListTile(title: Text("第八个tab")),
                    ListTile(title: Text("第八个tab"))
                  ],
                )
              ],
            )),
      ),
      drawer: const HomeDrawer(),

    );
  }
}
