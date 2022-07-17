class WebAsset {
  final String location;

  const WebAsset({
    required this.location,
  });

  String get filename {
    
    return location.split("/").last;
  }

  String get extension {
    return location.split(".").last;
  }
}
