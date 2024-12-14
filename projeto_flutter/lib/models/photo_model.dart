import 'package:flutter_app/models/location_model.dart';

class PhotoData {
  final String id;
  final String path;
  final String timestamp;
  final LocationData? location;

  PhotoData({
    required this.id,
    required this.path,
    required this.timestamp,
    this.location,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'path': path,
      'timestamp': timestamp,
      'location': location?.toJson(),
    };
  }

  factory PhotoData.fromJson(Map<String, dynamic> json) {
    return PhotoData(
      id: json['id'],
      path: json['path'],
      timestamp: json['timestamp'],
      location: json['location'] != null 
          ? LocationData.fromJson(json['location'])
          : null,
    );
  }
}
