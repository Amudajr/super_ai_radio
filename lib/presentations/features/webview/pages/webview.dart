import 'package:ai_radio/utils/ai_utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class RadioWebview extends StatefulWidget {
  const RadioWebview({
    super.key,
    required this.radioUrl,
    required this.tagline,
  });

  final String? radioUrl;
  final String? tagline;

  @override
  State<RadioWebview> createState() => _RadioWebviewState();
}

class _RadioWebviewState extends State<RadioWebview> {
  int _stackIndex = 1;

  InAppWebViewController? webViewController;

  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AIColors.primaryColor1,
        title: Text(widget.tagline!,
            style: const TextStyle(
              fontFamily: "DM Sans",
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            )),
        leading: InkWell(
          onTap: () {
            context.navigateBack();
          },
          child: const Icon(Icons.cancel_outlined),
        ),
      ),
      body: IndexedStack(index: _stackIndex, children: [
        InAppWebView(
          key: webViewKey,
          initialUrlRequest: URLRequest(url: Uri.parse(widget.radioUrl!)),
          initialOptions: options,
          onConsoleMessage: (controller, consoleMessage) {
            SnackBar(content: Text(consoleMessage.message));
          },
          // onUpdateVisitedHistory: (webViewController, uri, _) {
          //   if (uri.toString() ==
          //       "https://naijaworkers.herokuapp.com/transactions/complete-card-transaction") {
          //     context.back();
          //   }
          // },
          // onTitleChanged: (controller, title) {
          //   if (title!.isNotEmpty && title != "Paystack Checkout") {
          //     context.router.replace(const SuccessAddMoneyRouter());
          //   }
          // },
          // onWebViewCreated: (InAppWebViewController controller) {
          //   webViewController = controller;

          //   controller.addJavaScriptHandler(
          //       handlerName: "mySum",
          //       callback: (args) {
          //         // Here you receive all the arguments from the JavaScript side
          //         // that is a List<dynamic>
          //         print("From the JavaScript side:");
          //         print(args);
          //         return args.reduce((curr, next) => curr + next);
          //       });
          // },
          onLoadStop: (_, __) {
            setState(() {
              _stackIndex = 0;
            });
          },
          onLoadError: (_, __, ___, ____) {
            setState(() {
              _stackIndex = 0;
            });
          },
          onLoadHttpError: (_, __, ___, ____) {
            setState(() {
              _stackIndex = 0;
            });
          },
        ),
        const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ]),
    );
  }
}
