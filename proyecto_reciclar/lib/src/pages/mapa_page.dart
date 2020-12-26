import 'package:flutter/material.dart';
import 'package:proyecto_reciclar/src/models/mapa_model.dart';
import 'package:proyecto_reciclar/src/providers/mapa_provider.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final mapaProvider = new MapaProvider();

  Future<List<MapaModel>> info;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    info = mapaProvider.getMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        builder:
            (BuildContext context, AsyncSnapshot<List<MapaModel>> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Text('Id: ${data[index].idMapa}'),
                    Text(
                      'Lat: ${data[index].lat}, Lng: ${data[index].lng}',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
