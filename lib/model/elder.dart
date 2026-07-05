class Elder {
  final int elderId;
  final String name;
  final int? imageId;
  final String? imageUrl;
  final String mobilityLevel;
  final String cognitiveStatus;
  final bool usesDiaper;

  Elder({
    required this.elderId,
    required this.name,
    required this.imageId,
    required this.imageUrl,
    required this.mobilityLevel,
    required this.cognitiveStatus,
    required this.usesDiaper,
  });

  factory Elder.fromJson(Map<String, dynamic> json) {
    return Elder(
      elderId: json['elderId'] ?? 0,
      name: json['name'] ?? '',
      imageId: json['imageId'],
      imageUrl: json['imageUrl'],
      mobilityLevel: json['mobilityLevel'] ?? '',
      cognitiveStatus: json['cognitiveStatus'] ?? '',
      usesDiaper: json['usesDiaper'] ?? false,
    );
  }
}
