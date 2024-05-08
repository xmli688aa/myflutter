import 'dart:math';

import 'package:flutter/material.dart';

class SliverPage extends StatefulWidget {
  const SliverPage({super.key});

  @override
  State<SliverPage> createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 导航栏 设置头部背景等
          _buildSliverAppBar(),
          // 网格布局
          _buildSliverGrid(),
          // header固定滚动到顶部会浮动 具体内容是有UnitPersistentHeaderDelegate显示
          SliverPersistentHeader(
            delegate: UnitPersistentHeaderDelegate(),
            pinned: true,
          ),
          // 对正常的Widget的包装
          _buildSliverToBoxAdapter(),
          // 对SliverPersistentHeaderDelegate的封装 子Widget可以自己动态传
          _buildSliverPersistentHeader(),
          _buildSliverPadding(),
          _buildSliverFillRemaining(),
          _buildSliverFillViewport(),
        ],
      ),
    );
  }

  _buildSliverPersistentHeader() {
    return SliverPersistentHeader(
        pinned: true,
        floating: false,
        delegate: PersistentHeaderBuilder(
            builder: (ctx, offset) => Container(
                  alignment: Alignment.center,
                  color: Colors.green,
                  child: Text(
                    "shrinkOffset:${offset.toStringAsFixed(1)}",
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )));
  }

  // 可以向上滚动的Appbar
  _buildSliverAppBar() {
    return SliverAppBar(
        // title: const Text('Sliver组件'),
        // leading: Container(),
        centerTitle: true,
        // 展开的高度
        expandedHeight: 250.0,
        // 强制显示阴影
        forceElevated: true,
        // 如果设置了 floating 属性，当有下拉动作时，会显示 AppBar
        floating: true,
        // 该属性只有在 floating 为 true 的情况下使用，不然会报错
        // 当上滑到一定的比例，会自动把 AppBar 收缩（不知道是不是 bug，当 AppBar 下面的部件没有被 AppBar 覆盖的时候，不会自动收缩）
        // 当下滑到一定比例，会自动把 AppBar 展开
        snap: true,
        // 设置该属性使 Appbar 折叠后不消失
        //滚动是否可以超过AppBar
        pinned: true,
        // 通过这个属性设置 AppBar 的背景
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: const EdgeInsets.all(0), //这个值不设置会导致下面的text文本不居中 奇怪
          title: Container(
            alignment: Alignment.center,
            // color: Colors.orangeAccent,
            width: double.infinity,
            height: 44,
            child: const Text(
              "SliverPage",
              // style: TextStyle(color: Colors.green),
            ),
          ),
          // centerTitle: true,
          // 背景折叠动画
          collapseMode: CollapseMode.parallax,
          background:
              Image.asset('assets/images/headerIcon.jpg', fit: BoxFit.cover),
        ));
  }

  // Grid网格布局
  _buildSliverGrid() {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(childCount: 6,
            (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Color.fromARGB(255, Random().nextInt(255),
                Random().nextInt(255), Random().nextInt(255)),
            child: const Text("hello world"),
          );
        }),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 2));
  }

  // CustomScrollView 中只允许传入 Sliver 部件，那么类似 Container 等普通部件就不可以使用了
  // 所以为了方便，直接通过 SliverToBoxAdapter 对普通部件进行包裹，这样就成为一个 Sliver 部件了。
  // 总结下 SliverToBoxAdapter 的功能就是 把一个普通部件包裹成为 Sliver 部件
  _buildSliverToBoxAdapter() {
    return SliverToBoxAdapter(
      child: Container(
        height: 150,
        color: Colors.yellow,
        child: const Center(
          child: Text(
            'This is a non-scrollable widget.',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  // SliverPadding是一个Sliver组件，用于在子组件周围添加填充。它非常类似于Padding组件，但它是在滚动视图中使用的。
  // 您可以通过设置padding属性来控制添加的填充量，并将SliverPadding作为子组件包装在SliverList或SliverGrid中。这可以用于在子元素之间添加间距或在内容周围创建边框。
  _buildSliverPadding() {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.blue[100 * (index % 9 + 1)],
            );
          },
          childCount: 5,
        ),
      ),
    );
  }

  // SliverFillRemaining是一个可以填充剩余滚动空间的组件。
  // 这个部件一般用于最后填充用的，会占有一个屏幕的高度，可以在 child 属性加入需要展示的部件
  // 当您有一个可滚动的视图，但其子元素的总高度不足以填满视图时，您可以使用SliverFillRemaining来填充剩余的空间。这对于在滚动视图中添加底部导航栏或页脚非常有用。
  _buildSliverFillRemaining() {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Container(
        color: Colors.green,
        child: const Center(
          child: Text(
            'This is a non-scrollable widget that fills the remaining space.',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  // SliverFillViewport是一个可以填充整个可滚动视图的组件。
  // 与SliverFillRemaining不同的是，SliverFillViewport将子组件拉伸以填充整个可滚动区域，而不是只填充剩余的空间。
  // 这可以用于创建具有动态高度的自定义滚动视图，例如带有动画的背景或可扩展的抽屉式菜单。
  // 在此示例中，使用SliverFillViewport创建了一个视口，该视口填充整个可用空间，并按比例显示其中的项目。使用了60％的视口比例，并使用SliverChildBuilderDelegate生成了20个颜色方块。
  _buildSliverFillViewport() {
    return SliverFillViewport(
      viewportFraction: 0.6, //
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            height: 50, //这个高度没有用 实际显示范围是viewportFraction的比例来控制的
            color: Colors.blue[100 * (index % 9 + 1)],
            child: Center(child: Text('位置：$index')),
          );
        },
        childCount: 20,
      ),
    );
  }
}

class UnitPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print(
        "=====shrinkOffset:$shrinkOffset======overlapsContent:$overlapsContent====");
    final String info = 'shrinkOffset:${shrinkOffset.toStringAsFixed(1)}'
        '\noverlapsContent:$overlapsContent';
    return Container(
      alignment: Alignment.center,
      color: Colors.orangeAccent,
      child: Text(
        info,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  @override
  double get maxExtent => 120;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class PersistentHeaderBuilder extends SliverPersistentHeaderDelegate {
  final double max;
  final double min;
  final Widget Function(BuildContext context, double offset) builder;

  PersistentHeaderBuilder(
      {this.max = 120, this.min = 80, required this.builder})
      : assert(max >= min && builder != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(context, shrinkOffset);
  }

  @override
  double get maxExtent => max;

  @override
  double get minExtent => min;

  @override
  bool shouldRebuild(covariant PersistentHeaderBuilder oldDelegate) =>
      max != oldDelegate.max ||
      min != oldDelegate.min ||
      builder != oldDelegate.builder;
}
