import 'package:auto_route/auto_route.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class WebPage extends StatefulWidget {
  const WebPage({Key? key, required this.url, this.title}) : super(key: key);

  final String url;
  final String? title;

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  String title = "";
  String url = "";

  late bool _isLoadingPage;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (widget.title != null) {
      title = widget.title!;
    } else {
      title = widget.url.split("//")[1].split("/")[0];
    }
    url = widget.url;
    _isLoadingPage = true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            title,
            // style: TextStyle(
            //   color: Colors.grey[900],
            //   fontWeight: FontWeight.w600,
            //   fontSize: 16,
            // ),
          ),
        ),
        body: Column(
          children: <Widget>[
            if (_isLoadingPage)
              Container(
                alignment: FractionalOffset.center,
                height: 3,
                child: const LinearProgressIndicator(),
              ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: webPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget webPage() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
          webViewController.clearCache();
        },
        onPageFinished: (finish) {
          setState(() {
            _isLoadingPage = false;
          });
        },
      );
    });
    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      onPageFinished: (finish) {
        setState(() {
          _isLoadingPage = false;
        });
      },
    );
  }
}
