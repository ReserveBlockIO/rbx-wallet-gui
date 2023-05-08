import 'html_helpers_interface.dart';

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

  @override
  void triggerDownload(String url) {
    print(url);
  }

  @override
  void reload() {
    print("Not implemented for non web");
  }
}
