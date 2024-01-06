import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:io';


class SetMapPage extends StatefulWidget {
  const SetMapPage({Key? key}) : super(key: key);
  @override
  State<SetMapPage> createState() => _SetMapPageState();
}

class _SetMapPageState extends State<SetMapPage> {

  //gps feature code start
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _center = CameraPosition(
    target: LatLng(46.73200184013239, -117.1542125881912),
    zoom: 14.4746,
  );

  final List<Marker> _markers = <Marker>[
    const Marker(
      markerId: MarkerId("Transfer Station"),
      position: LatLng(46.73200184013239, -117.1542125881912),
      infoWindow: InfoWindow(title: 'Transfer Station'),
    ),
    const Marker(
      markerId: MarkerId("State and Harrison"),
      position: LatLng(46.736386,-117.17826),
      infoWindow: InfoWindow(title: 'State and Harrison'),
    ),
    const Marker(
      markerId: MarkerId("Harrison and Fisk"),
      position: LatLng(46.736569,-117.184251),
      infoWindow: InfoWindow(title: 'Harrison and Fisk'),
    ),
    const Marker(
      markerId: MarkerId("Clifford and Harrison"),
      position: LatLng(46.736778,-117.185612),
      infoWindow: InfoWindow(title: 'Clifford and Harrison'),
    ),
    const Marker(
      markerId: MarkerId("Clifford and Darrow"),
      position: LatLng(46.739561,-117.185603),
      infoWindow: InfoWindow(title: 'Clifford and Darrow'),
    ),
    const Marker(
      markerId: MarkerId("Darrow and Orion"),
      position: LatLng(46.739773,-117.183234),
      infoWindow: InfoWindow(title: 'Darrow and Orion'),
    ),
    const Marker(
      markerId: MarkerId("Jefferson Elementary"),
      position: LatLng(46.739252,-117.18143),
      infoWindow: InfoWindow(title: 'Jefferson Elementary'),
    ),
    const Marker(
      markerId: MarkerId("State and Timothy"),
      position: LatLng(46.740483,-117.178262),
      infoWindow: InfoWindow(title: 'State and Timothy'),
    ),
    const Marker(
      markerId: MarkerId("Janet and Hall"),
      position: LatLng(46.742298,-117.177481),
      infoWindow: InfoWindow(title: 'Janet and Hall'),
    ),
    const Marker(
      markerId: MarkerId("Hall and Orion"),
      position: LatLng(46.743912,-117.179125),
      infoWindow: InfoWindow(title: 'Hall and Orion'),
    ),
    const Marker(
      markerId: MarkerId("Aquatic Center on Hall"),
      position: LatLng(46.744881,-117.180358),
      infoWindow: InfoWindow(title: 'Aquatic Center on Hall'),
    ),
    const Marker(
      markerId: MarkerId("Larry and Lamont"),
      position: LatLng(46.746938,-117.176654),
      infoWindow: InfoWindow(title: 'Larry and Lamont'),
    ),const Marker(
      markerId: MarkerId("Dillon and Terre View"),
      position: LatLng(46.750406,-117.174009),
      infoWindow: InfoWindow(title: 'Dillon and Terre View'),
    ),
    const Marker(
      markerId: MarkerId("Clay Court"),
      position: LatLng(46.751767,-117.175624),
      infoWindow: InfoWindow(title: 'Clay Court'),
    ),
    const Marker(
      markerId: MarkerId("Palouse Trace Apartments"),
      position: LatLng(46.748649,-117.169761),
      infoWindow: InfoWindow(title: 'Palouse Trace Apartments'),
    ),
    const Marker(
      markerId: MarkerId("Pimlico on Terre View"),
      position: LatLng(46.743498,-117.163658),
      infoWindow: InfoWindow(title: 'Pimlico on Terre View'),
    ),
    const Marker(
      markerId: MarkerId("Merman and Valley"),
      position: LatLng(46.740671,-117.159303),
      infoWindow: InfoWindow(title: 'Merman and Valley'),
    ),
    const Marker(
      markerId: MarkerId("Schweitzer Drive"),
      position: LatLng(46.746222,-117.168289),
      infoWindow: InfoWindow(title: 'Schweitzer Drive'),
    ),const Marker(
      markerId: MarkerId("Terre View Bridge"),
      position: LatLng(46.750044,-117.170224),
      infoWindow: InfoWindow(title: 'Terre View Bridge'),
    ),
    const Marker(
      markerId: MarkerId("Grand and Terre View"),
      position: LatLng(46.750059,-117.171959),
      infoWindow: InfoWindow(title: 'Grand and Terre View'),
    ),
  ];
  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR$error");
    });
    return await Geolocator.getCurrentPosition();
  }
  //gps feature code end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _center,
          markers: Set<Marker>.of(_markers),
          myLocationEnabled: true,
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
        ),
      ),
      // on pressing floating action button the camera will take to user current location
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          getUserCurrentLocation().then((value) async {
            print("${value.latitude} ${value.longitude}");
            // marker added for current users location
            _markers.add(
                Marker(
                  markerId: const MarkerId("2"),
                  position: LatLng(value.latitude, value.longitude),
                  infoWindow: const InfoWindow(
                    title: 'My Current Location',
                  ),
                )
            );
            // specified current users location
            CameraPosition cameraPosition = CameraPosition(
              target: LatLng(value.latitude, value.longitude),
              zoom: 14,
            );
            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {
            });
          });
        },
        child: const Icon(Icons.local_activity),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
