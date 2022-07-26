import 'package:flutter/cupertino.dart';
import 'package:short_video/utils/color_util.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../widgets/custom_scaffold.dart';

class WebViewPage extends StatefulWidget {
  final String initialUrl;
  const WebViewPage({Key? key, required this.initialUrl}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _controller;
  String _title = "";

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      context: context,
      elevation: 0,
      title: _title,
      bottomSafeArea: false,
      backgroundColor: ColorsUtil.COLOR_FFFFFF,
      child: _buildWebViewContent(),
    );
  }

  Widget _buildWebViewContent() {
    return WebView(
      initialUrl: widget.initialUrl,
      //JS执行模式 是否允许JS执行
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {
        _controller = controller;
      },
      onPageFinished: (url) {
        _controller.evaluateJavascript("document.title").then((result) {
          debugPrint("----------$result");
          setState(() {
            _title = result.replaceAll("\"", "");
          });
        });
      },
      navigationDelegate: (NavigationRequest request) {
        if (request.url.startsWith("myapp://")) {
          debugPrint("即将打开 ${request.url}");

          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
      javascriptChannels: <JavascriptChannel>{
        JavascriptChannel(
            name: "share",
            onMessageReceived: (JavascriptMessage message) {
              debugPrint("参数： ${message.message}");
            }),
      },
    );
  }
}
