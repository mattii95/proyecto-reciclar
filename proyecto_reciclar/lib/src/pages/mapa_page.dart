import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:proyecto_reciclar/src/models/mapa_model.dart';
import 'package:proyecto_reciclar/src/providers/mapa_provider.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  static const String ACCESS_TOKEN =
      "pk.eyJ1Ijoia291cmFzOTUiLCJhIjoiY2tpZHI2azJnMHo5eTJzbXU4b3BndjNqbiJ9.tNb6Vh8Gm7hrUwal1KSdKg";

  MapboxMapController mapController;

  final mapaProvider = new MapaProvider();

  Future<List<MapaModel>> info;

  @override
  void initState() {
    super.initState();

    info = mapaProvider.getMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: info,
        builder:
            (BuildContext context, AsyncSnapshot<List<MapaModel>> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            return MapboxMap(
              accessToken: ACCESS_TOKEN,
              onMapCreated: (MapboxMapController controller) {
                mapController = controller;

                data.forEach((marker) async {
                  var latLgn = LatLng(double.parse(marker.lat).toDouble(),
                      double.parse(marker.lng).toDouble());

                  var icon = await get(marker.icon);

                  await mapController.addImage('categorias', icon.bodyBytes);

                  await mapController.addSymbol(
                    SymbolOptions(
                      geometry: latLgn,
                      iconImage: 'categorias',
                      iconSize: 2.0,
                    ),
                  );
                  print(latLgn);
                });

                setState(() {});
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(-31.55406181397689, -63.53542094091372),
                zoom: 13.0,
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
