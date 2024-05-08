import 'package:flutter/material.dart';

class ETIntrinsicHeightPage extends StatefulWidget {
  const ETIntrinsicHeightPage({super.key});

  @override
  State<ETIntrinsicHeightPage> createState() => _ETIntrinsicHeightPageState();
}

class _ETIntrinsicHeightPageState extends State<ETIntrinsicHeightPage> {
  @override
  Widget build(BuildContext context) {
    String address = '''广东省深圳市南山区沙河西路1841路深圳湾生态科技园
    广东省深圳市南山区沙河西路1841路深圳湾生态科技园
    广东省深圳市南山区沙河西路1841路深圳湾生态科技园
    广东省深圳市南山区沙河西路1841路深圳湾生态科技园
    广东省深圳市南山区沙河西路1841路深圳湾生态科技园
    广东省深圳市南山区沙河西路1841路深圳湾生态科技园
    广东省深圳市南山区沙河西路1841路深圳湾生态科技园
    广东省深圳市南山区沙河西路1841路深圳湾生态科技园
                ''';
    address = address.replaceAll('\n', '');
    address = address.replaceAll('  ', ' ');

    return Scaffold(
      appBar: AppBar(
        title: const Text('根据子组件高度自由控制高度'),
      ),
      body: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            appText(
              '教学地址:',
              16,
              bold: true,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: appText(
                address,
                12,
                maxLines: null,
                textAlign: TextAlign.left,
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '￥',
                      style: TextStyle(
                        color: Color(0xFFF17051),
                        fontSize: 12,
                        fontFamily: 'PingFang SC',
                        fontWeight: FontWeight.w600,
                        height: 1.17,
                      ),
                    ),
                    TextSpan(
                      text: '0.6',
                      style: TextStyle(
                        color: Color(0xFFF17051),
                        fontSize: 24,
                        fontFamily: 'DIN-Bold',
                        fontWeight: FontWeight.w700,
                        height: 0.58,
                      ),
                    ),
                    TextSpan(
                      text: '/课时',
                      style: TextStyle(
                        color: Color(0xFFF17051),
                        fontSize: 12,
                        fontFamily: 'PingFang SC',
                        fontWeight: FontWeight.w400,
                        height: 1.17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  appText(String title, double fontSize,
      {Color? color = Colors.black,
      int? maxLines = 1,
      TextAlign? textAlign = TextAlign.left,
      bool? bold = false}) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: bold! ? FontWeight.bold : FontWeight.normal,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
