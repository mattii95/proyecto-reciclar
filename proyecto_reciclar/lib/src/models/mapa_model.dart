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
    this.idCategoria,
    this.activo,
  });

  int idMapa;
  String lat;
  String lng;
  String icon;
  int idCategoria;
  bool activo;

  factory MapaModel.fromJson(Map<String, dynamic> json) => MapaModel(
        idMapa: json["idMapa"],
        lat: json["lat"],
        lng: json["lng"],
        icon: json["icon"],
        idCategoria: json["idCategoria"],
        activo: json["Activo"],
      );

  Map<String, dynamic> toJson() => {
        "idMapa": idMapa,
        "lat": lat,
        "lng": lng,
        "icon": icon,
        "idCategoria": idCategoria,
        "Activo": activo,
      };
}
