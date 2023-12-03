import 'package:flutter/material.dart';

class ETHomePageContent extends StatefulWidget {
  const ETHomePageContent({Key? key}) : super(key: key);

  @override
  State<ETHomePageContent> createState() => _ETHomePageContentState();
}

class _ETHomePageContentState extends State<ETHomePageContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("hello world"),
    );
  }
}
