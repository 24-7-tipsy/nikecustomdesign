import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nikecustomdesign/main_page.dart';
import 'package:provider/provider.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.507776, -122.828144);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  List<Marker> allMarkers = [];

  @override
  void initState() {
    super.initState();
    allMarkers.add(
      Marker(
          markerId: MarkerId('myMarker'),
          draggable: false,
          onTap: () {
            print('Marker Tapped');
          },
          position: _center),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MapAnimationNotifier>(
      builder: (context, notifier, child) {
        double scale = 1 + 0.3 * (1 - notifier.value);
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..scale(scale, scale)
            ..rotateZ(
              0.05 * math.pi * (1 - notifier.value),
            ),
          child: Opacity(
            opacity: notifier.value,
            child: child,
          ),
        );
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 50),
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: Set.from(allMarkers),
        ),
      ),
    );
  }
}
