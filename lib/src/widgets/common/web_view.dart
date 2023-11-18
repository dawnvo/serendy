import 'package:flutter/material.dart';
import 'package:serendy/src/widgets/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  const WebView({required this.url});
  final String url;

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final _controller = WebViewController();
  int _stackToView = 1;

  @override
  void initState() {
    super.initState();
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          // * 로딩을 컨트롤해요.
          onPageFinished: (url) {
            if (!mounted) return;
            setState(() => _stackToView = 0);
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  void dispose() {
    _controller.clearLocalStorage();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IndexedStack(
        index: _stackToView,
        children: [
          WebViewWidget(controller: _controller),
          const Center(child: LoadingIndicator()),
        ],
      ),
    );
  }
}
