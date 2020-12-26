import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

import 'package:proyecto_reciclar/src/models/mapa_model.dart';

class MapaProvider {
  final soap = '''
    <?xml version="1.0" encoding="utf-8"?>
      <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
        <soap:Body>
          <BuscarPuntos xmlns="http://tempuri.org/" />
        </soap:Body>
      </soap:Envelope>
  ''';

  final url = "http://192.168.0.111/wspr/ws.asmx/BuscarPuntos";

  MapaProvider() {
    this.getMarkers();
  }

  Future<List<MapaModel>> getMarkers() async {
    final resp = await http.post(
      url,
      headers: {
        "Content-Type": "text/xml; charset=utf-8",
        "SOAPAction": "http://tempuri.org/BuscarPuntos"
      },
      body: soap,
    );

    if (resp.statusCode == 200) {
      final response = resp.body;

      final parseXml = xml.XmlDocument.parse(response).innerText;

      final jsonDecode = json.decode(parseXml) as List;

      List<MapaModel> markers =
          jsonDecode.map((e) => MapaModel.fromJson(e)).toList();

      print(markers);

      return markers;
    } else {
      throw Exception('Error al conectar con el webservice');
    }
  }
}
