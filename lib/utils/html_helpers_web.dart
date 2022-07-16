import 'package:rbx_wallet/utils/html_helpers_interface.dart';
import 'dart:html' as html;

class HtmlHelpersImplementation extends HtmlHelpersInterface {
  @override
  void redirect(String url) {
    html.window.open(url, "_self");
  }

  @override
  String getUrl() {
    return html.window.location.href;
  }

  @override
  String getUserAgent() {
    return html.window.navigator.userAgent;
  }
}
