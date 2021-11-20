import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  static const routeName = '/location';
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Position? _currentPosition;
  List<String> _currentPlaceInfo = [];

  @override
  void initState() {
    super.initState();

    Geolocator.checkPermission().then((permission) {
      if (permission == LocationPermission.denied) {
        Geolocator.requestPermission().then((permission) {
          if (permission == LocationPermission.denied) {
            _currentPlaceInfo.add('Location permission denied');
            return;
          }
          _updateCurrentPosition();
        });
      }
      _updateCurrentPosition();
    });
  }

  Future<void> _updateCurrentPosition() async {
    Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium,
    ).then((value) => setState(() {
          _currentPosition = value;
          placemarkFromCoordinates(
            _currentPosition?.latitude ?? 52.2165157,
            _currentPosition?.longitude ?? 6.9437819,
          ).then((placemarks) => setState(() {
                final place = placemarks.first;
                _currentPlaceInfo = place.toString().split('\n');
              }));
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: Center(
        child: _currentPosition == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _wrap('Lat: ${_currentPosition?.latitude}'),
                  _wrap('Long: ${_currentPosition?.longitude}'),
                  ..._currentPlaceInfo.map((place) => _wrap(place)),
                ],
              ),
      ),
    );
  }

  Widget _wrap(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        text ?? '',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
