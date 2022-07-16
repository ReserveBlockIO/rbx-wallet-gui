import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

FloatingActionButton buildSupportButton() {
  return FloatingActionButton.extended(
    onPressed: () {
      launchUrl(Uri.parse("https://discord.com/invite/PnS2HRETDh"));
    },
    label: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(FontAwesomeIcons.discord),
        SizedBox(
          width: 10,
        ),
        Text(
          "Support",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
