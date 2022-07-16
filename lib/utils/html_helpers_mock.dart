import 'package:rbx_wallet/utils/html_helpers_interface.dart';

class HtmlHelpersImplementation extends HtmlHelpersInterface {
  @override
  void redirect(String url) {
    return;
  }

  @override
  String getUrl() {
    return "";
  }

  @override
  String getUserAgent() {
    return "dart";
  }
}
