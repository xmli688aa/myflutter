import 'package:flutter/material.dart';

class ETHomePageContent extends StatefulWidget {
  const ETHomePageContent({Key? key}) : super(key: key);

  @override
  State<ETHomePageContent> createState() => _ETHomePageContentState();
}

class _ETHomePageContentState extends State<ETHomePageContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text("hello $index"),
          );
        });
  }
}
