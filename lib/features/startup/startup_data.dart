class StartupData {
  final String block;
  final String percent;

  const StartupData(this.block, this.percent);

  double get fraction {
    final str = percent.replaceAll("%", "");
    final doub = double.tryParse(str);
    if (doub != null) {
      return doub / 100;
    }

    return 0;
  }
}
