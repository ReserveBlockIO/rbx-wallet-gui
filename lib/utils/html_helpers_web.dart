// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;

import 'html_helpers_interface.dart';

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

  @override
  void triggerDownload(String url) {
    html.AnchorElement anchorElement = html.AnchorElement(href: url);
    anchorElement.download = url;
    anchorElement.target = "_blank";
    anchorElement.click();
  }

  @override
  void reload() {
    html.window.location.reload();
  }
}
