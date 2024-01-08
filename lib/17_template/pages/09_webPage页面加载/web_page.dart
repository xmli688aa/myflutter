import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebPage extends StatefulWidget {
  const WebPage({super.key});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late final WebViewController _controller;
  var progessValue = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(onProgress: (int progress) {
        // print('WebView is loading (progress : $progress%)');
        setState(() {
          progessValue = (progress / 100.0);
        });
      }, onPageStarted: (String url) {
        print("开始加载页面：$url");
      }, onPageFinished: (url) async {
        // 页面加载完成事件
        var cookie = await _controller
            .runJavaScriptReturningResult('document.cookie') as String;
        print("加载完成");
      }))
      ..loadRequest(Uri.parse('https://www.baidu.com'));
    // 与js交互
    _controller.addJavaScriptChannel("flutterOrder", onMessageReceived: (JavaScriptMessage message){
      //js发送过来的信息，我们可以进行处理或者跳转等
      print("flutter接收到了web端发送过来的flutterOrder消息${message.message}"); //js发送过来的信息

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('加载web页面'),
        actions: <Widget>[
          NavigationControls(webViewController: _controller),
        ],
      ),
      body: Column(
        children: [
          // 进度条
          progessValue<1? LinearProgressIndicator(
            color: Colors.greenAccent,
            backgroundColor: Colors.transparent,
            value: progessValue,
          ):Container(),
          Expanded(
              child: WebViewWidget(
            controller: _controller,
          )),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () async {
              var height = await _controller.runJavaScriptReturningResult(
                  'document.scrollingElement.scrollHeight') as double;
              var scrollTo = height ~/ 2;
              print("scrollTo:$scrollTo");
              _controller.scrollTo(0, scrollTo);
            },
            child: Text("滚动一半"),
          ),
          ElevatedButton(
            onPressed: () async {
              _controller.scrollTo(0, 0);
            },
            child: Text("滚动到顶部"),
          ),

          ElevatedButton(
            onPressed: () async {
              String fileHtmlContents = await rootBundle.loadString('assets/files/index.html');
              // _controller.loadFile(fileHtmlContents);
              print("fileHtmlContents:$fileHtmlContents");
              _controller.loadHtmlString(fileHtmlContents);
            },
            child: Text("加载本地Html"),
          ),
          ElevatedButton(
            onPressed: () async {
              //发送给web端消息，其中 webReceiveMessage 为 web 给 'name' 添加的方法
              _controller?.runJavaScript('flutterMessage.webReceiveMessage("收到了没")');
            },
            child: Text("发送消息给h5"),
          ),
        ],
      ),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls({super.key, required this.webViewController});

  final WebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () async {
            if (await webViewController.canGoBack()) {
              await webViewController.goBack();
            } else {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No back history item')),
                );
              }
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () async {
            if (await webViewController.canGoForward()) {
              await webViewController.goForward();
            } else {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No forward history item')),
                );
              }
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.replay),
          onPressed: () => webViewController.reload(),
        ),
      ],
    );
  }
}
