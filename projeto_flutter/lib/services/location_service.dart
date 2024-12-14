

import 'dart:math';

class LocationData {
  final double latitude;
  final double longitude;
  final double altitude;
  final double speed;
  final DateTime timestamp;

  LocationData({
    required this.latitude,
    required this.longitude,
    required this.altitude,
    required this.speed,
    required this.timestamp,
  });
}

class LocationService {
  // Base coordinates (São Paulo)
  double _baseLatitude = -23.550520;
  double _baseLongitude = -46.633308;
  
  // Simula movimento aleatório
  LocationData _generateRandomMovement() {
    // Gera pequenas variações nas coordenadas
    final random = Random();
    final latChange = (random.nextDouble() - 0.5) * 0.001; // ~100m
    final lonChange = (random.nextDouble() - 0.5) * 0.001;
    
    _baseLatitude += latChange;
    _baseLongitude += lonChange;

    return LocationData(
      latitude: _baseLatitude,
      longitude: _baseLongitude,
      altitude: 800 + random.nextDouble() * 10, // Altitude simulada
      speed: random.nextDouble() * 5, // Velocidade entre 0-5 m/s
      timestamp: DateTime.now(),
    );
  }

  // Simula obtenção da localização atual
  Future<LocationData> getCurrentLocation() async {
    // Simula delay de rede
    await Future.delayed(Duration(milliseconds: 500));
    return _generateRandomMovement();
  }

  // Simula stream de atualizações de localização
  Stream<LocationData> getLocationStream() {
    return Stream.periodic(
      Duration(seconds: 2),
      (_) => _generateRandomMovement(),
    );
  }

  // Simula cálculo de distância entre dois pontos
  double calculateDistance(LocationData start, LocationData end) {
    // Implementação simplificada da fórmula de Haversine
    const double earthRadius = 6371000; // metros
    
    final lat1 = start.latitude * pi / 180;
    final lat2 = end.latitude * pi / 180;
    final dLat = (end.latitude - start.latitude) * pi / 180;
    final dLon = (end.longitude - start.longitude) * pi / 180;

    final a = sin(dLat/2) * sin(dLat/2) +
        cos(lat1) * cos(lat2) *
        sin(dLon/2) * sin(dLon/2);
        
    final c = 2 * atan2(sqrt(a), sqrt(1-a));
    return earthRadius * c;
  }
}