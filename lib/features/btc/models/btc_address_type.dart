enum BtcAddressType {
  segwitP2SH(0, "SegwitP2SH"),
  segwit(1, "Segwit"),
  toproot(2, "Toproot"),
  ;

  final int value;
  final String label;
  const BtcAddressType(this.value, this.label);
}
