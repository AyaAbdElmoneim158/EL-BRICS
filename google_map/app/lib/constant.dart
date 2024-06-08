List<Map<String, dynamic>> latLngGovernorateOfEgypt = [
  {"name": "Cairo", "latitude": 30.0444, "longitude": 31.2357},
  {"name": "Alexandria", "latitude": 31.2001, "longitude": 29.9187},
  {"name": "Giza", "latitude": 30.0131, "longitude": 31.2089},
  {"name": "Luxor", "latitude": 25.6872, "longitude": 32.6396},
  {"name": "Aswan", "latitude": 24.0889, "longitude": 32.8998},
  {"name": "Port Said", "latitude": 31.2565, "longitude": 32.2841},
  {"name": "Suez", "latitude": 29.9668, "longitude": 32.5498},
  {"name": "Ismailia", "latitude": 30.6043, "longitude": 32.2722},
  {"name": "Qalyubia", "latitude": 30.3285, "longitude": 31.1988},
  {"name": "Minya", "latitude": 28.1182, "longitude": 30.7437},
  {"name": "Sharqia", "latitude": 30.6295, "longitude": 31.548},
  {"name": "Gharbia", "latitude": 30.819, "longitude": 31.4963},
  {"name": "Dakahlia", "latitude": 31.1296, "longitude": 31.5657},
  {"name": "Faiyum", "latitude": 29.3084, "longitude": 30.8418},
  {"name": "Beni Suef", "latitude": 29.0737, "longitude": 31.0958},
  {"name": "Ismailia", "latitude": 30.6043, "longitude": 32.2722},
  {"name": "Kafr El Sheikh", "latitude": 31.1094, "longitude": 30.9397},
  {"name": "Matrouh", "latitude": 31.3585, "longitude": 27.2371},
  {"name": "Qena", "latitude": 26.1604, "longitude": 32.7167},
  {"name": "Sohag", "latitude": 26.5569, "longitude": 31.6948},
  {"name": "Asyut", "latitude": 27.1824, "longitude": 31.1837},
  {"name": "Damietta", "latitude": 31.4158, "longitude": 31.8133},
  {"name": "New Valley", "latitude": 25.2103, "longitude": 30.423},
  {"name": "Red Sea", "latitude": 26.5765, "longitude": 33.9369},
  {"name": "North Sinai", "latitude": 31.2546, "longitude": 33.7873},
  {"name": "South Sinai", "latitude": 28.5395, "longitude": 33.9756},
  {"name": "Monufia", "latitude": 30.4697, "longitude": 31.1849},
  {"name": "Beheira", "latitude": 30.8741, "longitude": 30.2642},
];
/*
class Governorate {
  final String name;
  final double latitude;
  final double longitude;

  Governorate({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory Governorate.fromJson(Map<String, dynamic> json) {
    return Governorate(
      name: json['name'] ?? '',
      latitude: json['latitude']?.toDouble() ?? 0.0,
      longitude: json['longitude']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

void main() {
  // Dummy data for the governorates
  List<Map<String, dynamic>> dummyData = [
    {"name": "Cairo", "latitude": 30.0444, "longitude": 31.2357},
    {"name": "Alexandria", "latitude": 31.2001, "longitude": 29.9187},
    // Add more governorates here...
  ];

  // Convert dummy data to Governorate objects
  List<Governorate> governorates = dummyData.map((data) => Governorate.fromJson(data)).toList();

  // Print the converted data for verification
  governorates.forEach((governorate) {
    print('${governorate.name}: Latitude ${governorate.latitude}, Longitude ${governorate.longitude}');
  });
}

 */