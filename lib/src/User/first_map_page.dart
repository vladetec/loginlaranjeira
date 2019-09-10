import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FirstPageMap extends StatefulWidget {
  @override
  _FirstPageMapState createState() => _FirstPageMapState();
}

class _FirstPageMapState extends State<FirstPageMap> {
  List<Marker> marcadores = [];

  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    marcadores.add(Marker(
        markerId: MarkerId("Jp1"),
        position: LatLng(-7.144390, -34.843203),
        infoWindow: InfoWindow(title: "Profissão A"),
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Entrar como Usuário"),
            backgroundColor: Theme.of(context).primaryColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Stack(
          children: <Widget>[_googlemap(context)],
        ));
  }

  Widget _googlemap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(-7.153272, -34.853710), zoom: 15),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {jpMarcador1, jpMarcador2},
      ),
    );
  }
}

Marker jpMarcador1 = Marker(
    markerId: MarkerId("Jp1"),
    position: LatLng(-7.144390, -34.843203),
    infoWindow: InfoWindow(title: "Profissão A"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow));

Marker jpMarcador2 = Marker(
    markerId: MarkerId("Jp2"),
    position: LatLng(-7.125606, -34.862736),
    infoWindow: InfoWindow(title: "Profissão B"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow));
