import 'package:flutter/material.dart';
import 'dart:math';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double _latitude = 0.0;
  double _longitude = 0.0;

  void _simulateLocationUpdate() {
    // Simula mudança de localização
    setState(() {
      _latitude += Random().nextDouble() * 0.001 * (Random().nextBool() ? 1 : -1);
      _longitude += Random().nextDouble() * 0.001 * (Random().nextBool() ? 1 : -1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPS Simulado'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Localização Atual:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 20),
            Text(
              'Latitude: ${_latitude.toStringAsFixed(6)}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Longitude: ${_longitude.toStringAsFixed(6)}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _simulateLocationUpdate,
              child: Text('Atualizar Localização'),
            ),
          ],
        ),
      ),
    );
  }
}