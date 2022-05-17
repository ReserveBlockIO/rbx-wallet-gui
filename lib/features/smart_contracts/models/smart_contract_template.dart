import 'package:flutter/material.dart';

class SmartContractTemplate {
  final String name;
  final String description;
  final List<String> images;
  final Color color;
  final Function() init;
  final Widget? learnMoreContent;

  SmartContractTemplate({
    required this.name,
    required this.description,
    required this.init,
    required this.color,
    required this.images,
    this.learnMoreContent,
  });
}
