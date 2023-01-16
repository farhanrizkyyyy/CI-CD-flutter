class Geo {
  String? lat;
  String? lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;

    return data;
  }
}
