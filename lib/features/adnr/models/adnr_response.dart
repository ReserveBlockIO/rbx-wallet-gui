class AdnrResponse {
  final bool success;
  final String message;
  final String? hash;

  const AdnrResponse({
    required this.success,
    required this.message,
    this.hash,
  });
}
