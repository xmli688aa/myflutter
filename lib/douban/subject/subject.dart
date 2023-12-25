
import 'package:flutter/material.dart';

class ETSubjectPage extends StatelessWidget {
  const ETSubjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("书影音"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/headerIcon.jpg",
                width: 200,
                height: 200,
                fit: BoxFit.fill,
              ),
            ),
            // CircleAvatar(
            //   radius: 100,
            //   backgroundImage: NetworkImage(imageUrl),
            //   // child: _image2,
            // ),
          ],
        ),
      ),
    );
  }
}
