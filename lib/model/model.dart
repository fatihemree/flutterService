class Country {
  String sehir;
  String ilce;

  Country({this.sehir, this.ilce});

  Country.fromJson(Map<String, dynamic> json) {
    sehir = json['sehir'];
    ilce = json['ilce'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sehir'] = this.sehir;
    data['ilce'] = this.ilce;
    return data;
  }
}
