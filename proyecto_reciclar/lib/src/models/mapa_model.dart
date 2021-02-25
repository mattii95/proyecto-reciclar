// To parse this JSON data, do
//
//     final mapaModel = mapaModelFromJson(jsonString);

import 'dart:convert';

List<MapaModel> mapaModelFromJson(String str) =>
    List<MapaModel>.from(json.decode(str).map((x) => MapaModel.fromJson(x)));

String mapaModelToJson(List<MapaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MapaModel {
  MapaModel({
    this.idMapa,
    this.lat,
    this.lng,
    this.icon,
    this.activo,
  });

  int idMapa;
  String lat;
  String lng;
  String icon;
  bool activo;

  factory MapaModel.fromJson(Map<String, dynamic> json) => MapaModel(
        idMapa: json["idMapa"],
        lat: json["lat"],
        lng: json["lng"],
        icon: json["icon"],
        activo: json["Activo"],
      );

  Map<String, dynamic> toJson() => {
        "idMapa": idMapa,
        "lat": lat,
        "lng": lng,
        "icon": icon,
        "Activo": activo,
      };
}
