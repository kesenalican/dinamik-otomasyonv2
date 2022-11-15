class City {
  City({
    required this.cityName,
    required this.cityCode,
    required this.counties,
  });

  String cityName;
  String cityCode;
  List<County> counties;

  factory City.fromJson(Map<String, dynamic> json) {
    var list = json["ilceler"] as List;

    List<County> countyList = list.map((i) => County.fromJson(i)).toList();

    return City(
      cityName: json["il_adi"],
      cityCode: json["plaka_kodu"],
      counties: json["ilceler"] != null ? countyList : <County>[],
    );
  }

  Map<String, dynamic> toJson() => {
        "il_adi": cityName,
        "plaka_kodu": cityCode,
        "ilceler": List<dynamic>.from(counties.map((x) => x.toJson())),
      };
}

class County {
  County({
    required this.countyName,
  });

  String countyName;

  factory County.fromJson(Map<String, dynamic> json) => County(
        countyName: json["ilce_adi"],
      );

  Map<String, dynamic> toJson() => {
        "ilce_adi": countyName,
      };
}
