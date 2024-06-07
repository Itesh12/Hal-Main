class CropReport {
  final String id;
  final String url;
  final DateTime createdAt;

  CropReport({required this.id, required this.url, required this.createdAt});

  factory CropReport.fromJson(Map<String, dynamic> json) {
    return CropReport(
        createdAt: DateTime.parse(json['createdAt']),
        url: json['url'],
        id: json["_id"]);
  }
}
