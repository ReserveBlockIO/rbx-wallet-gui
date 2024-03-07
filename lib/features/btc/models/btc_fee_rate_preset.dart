enum BtcFeeRatePreset {
  minimum("minimumFee", "Minimum"),
  economy("economyFee", "Economy"),
  hour("hourFee", "Hour"),
  halfHour("halfHourFee", "Half Hour"),
  fastest("fastestFee", "Fastest"),
  custom("", "Custom"),
  ;

  final String apiValue;
  final String label;
  const BtcFeeRatePreset(this.apiValue, this.label);
}
