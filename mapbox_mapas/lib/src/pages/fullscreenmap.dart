import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';


class FullScreenMap extends StatefulWidget {

  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  MapboxMapController mapController;

  void _onMapCreated(MapboxMapController controller){
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapboxMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: 
        const CameraPosition(target: LatLng(40.8223286, -96.7982002)),
      ),
    );
  }
}