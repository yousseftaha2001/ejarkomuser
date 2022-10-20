import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webHelper extends StatelessWidget {
  webHelper({Key? key}) : super(key: key);
  WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    String jsCode =
        '''<script src="https://test.oppwa.com/v1/paymentWidgets.js?checkoutId=F53906928228B8DC4202D50891985D77.uat01-vm-tx03"></script>
<form action="https://hyperpay.docs.oppwa.com/tutorials/integration-guide" class="paymentWidgets" data-brands="VISA MASTER AMEX"></form>''';
    print('he');
    return WebView(
      initialUrl: 'about:blank',
      onWebViewCreated: (WebViewController webViewController) {
        _controller = webViewController;
        print('he3');
        _loadHtmlFromAssets();
        print('he32');
      },
    );
  }

  _loadHtmlFromAssets() async {
    String jsCode =
        '''<script src="https://test.oppwa.com/v1/paymentWidgets.js?checkoutId=B941F17B494A50F15FE4E7057D2BEB37.uat01-vm-tx03"></script>
<form action="https://hyperpay.docs.oppwa.com/tutorials/integration-guide/customisation" class="paymentWidgets" data-brands="VISA MASTER AMEX"></form>''';
    _controller!.loadUrl(Uri.dataFromString(jsCode,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
