import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentDisclaimer extends StatelessWidget {
  const PaymentDisclaimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 16, color: Colors.white);

    final boldStyle = TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700);

    final linkStyle = TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.secondary, decoration: TextDecoration.underline);

    return RichText(
      text: TextSpan(
        style: textStyle,
        children: [
          TextSpan(text: "I understand that I will now be purchasing RBX native coin directly through Banxa ("),
          TextSpan(
            text: "www.banxa.com",
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(Uri.parse("https://www.banxa.com"));
              },
          ),
          TextSpan(
              text:
                  "), which is a third-party services platform. By proceeding and procuring services from Banxa, you acknowledge that you have read and agreed to Banxa’s "),
          TextSpan(
            text: "Terms of Use",
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(Uri.parse("https://banxa.com/wp-content/uploads/2023/06/Customer-Terms-and-Conditions-19-June-2023.pdf"));
              },
          ),
          TextSpan(text: " and "),
          TextSpan(
            text: "Privacy and Cookies Policy",
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(Uri.parse("https://banxa.com/wp-content/uploads/2023/06/Privacy-and-Cookies-Policy-19-June-2023.pdf"));
              },
          ),
          TextSpan(
              text:
                  ". You additionally understand that the ReserveBlock RBX Network is an autonomous and decentralized ecosystem and does not share in any fees whatsoever by you utilizing Banxa’s services and does not take any responsibility for any issues that may affect your transaction with any third-party service provider at anytime. For any questions related to Banxa’s services, please contact Banxa at "),
          TextSpan(
            text: "support.banxa.com",
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(Uri.parse("https://support.banxa.com"));
              },
          ),
          TextSpan(text: "."),
        ],
      ),
    );
  }
}
