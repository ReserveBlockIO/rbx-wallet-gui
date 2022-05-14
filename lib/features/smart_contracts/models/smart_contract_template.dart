class SmartContractTemplate {
  final String name;
  final String description;
  final Function() init;

  SmartContractTemplate({
    required this.name,
    required this.description,
    required this.init,
  });
}
