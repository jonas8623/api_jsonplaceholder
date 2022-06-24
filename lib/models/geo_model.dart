
class Geo {

  String? latitude;
  String? longitude;

  Geo({
    this.latitude,
    this.longitude
  });

  Geo.fromJson(Map<String, dynamic> json) {

    latitude = json['lat'];
    longitude = json['lng'];
  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = Map<String, dynamic>();

    data['lat'] = latitude;
    data['lng'] = longitude;
    return data;
  }

  @override
  String toString() {
    return 'Geo{latitude: $latitude, longitude: $longitude}';
  }
}