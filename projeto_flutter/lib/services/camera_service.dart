// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_app/models/photo_model.dart';
import 'package:intl/intl.dart' show DateFormat;

class CameraService {
  // Lista de fotos simuladas
  final List<PhotoData> _photos = [];
  
  // Configurações simuladas da câmera
  final Map<String, Size> _availableResolutions = {
    'low': Size(640, 480),
    'medium': Size(1280, 720),
    'high': Size(1920, 1080),
  };
  
  String _currentResolution = 'medium';
  bool _flashEnabled = false;
  double _zoomLevel = 1.0;

  // Getter para fotos
  List<PhotoData> get photos => List.unmodifiable(_photos);

  // Simula tirar uma foto
  Future<PhotoData> takePicture() async {
    // Simula delay da captura
    await Future.delayed(Duration(milliseconds: 500));

    final photo = PhotoData(
      id: 'photo_${DateTime.now().millisecondsSinceEpoch}',
      timestamp: DateTime.now().toIso8601String(), 
      path: 'photos',
    );

    _photos.add(photo);
    return photo;
  }

  // Configurações da câmera
  void setResolution(String resolution) {
    if (_availableResolutions.containsKey(resolution)) {
      _currentResolution = resolution;
    }
  }

  void toggleFlash() {
    _flashEnabled = !_flashEnabled;
  }

  void setZoom(double zoom) {
    if (zoom >= 1.0 && zoom <= 3.0) {
      _zoomLevel = zoom;
    }
  }

  // Simula preview da câmera
  Widget buildPreview() {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Center(
            child: Icon(
              Icons.camera_alt,
              size: 48,
              color: Colors.white54,
            ),
          ),
          if (_flashEnabled)
            Positioned(
              top: 16,
              right: 16,
              child: Icon(
                Icons.flash_on,
                color: Colors.yellow,
              ),
            ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Text(
              'Resolução: ${_currentResolution}\nZoom: ${_zoomLevel.toStringAsFixed(1)}x',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // Simula galeria de fotos
  Widget buildGallery() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: _photos.length,
      itemBuilder: (context, index) {
        final photo = _photos[index];
        return Container(
          color: Colors.grey[300],
          child: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: Icon(
                  Icons.image,
                  size: 48,
                  color: Colors.grey[600],
                ),
              ),
              Positioned(
                bottom: 4,
                left: 4,
                child: Text(
                  DateFormat('HH:mm:ss').format(photo.timestamp as DateTime),
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Simula processamento de imagem
  Future<PhotoData> applyFilter(PhotoData photo, String filter) async {
    // Simula delay do processamento
    await Future.delayed(Duration(milliseconds: 300));

    // Retorna uma nova foto simulando o filtro aplicado
    return PhotoData(
      id: '${photo.id}_filtered',
      timestamp: DateTime.now().toString(),
      location: photo.location, 
      path: 'simulated/path/to/filtered_photo.jpg',
    );
  }
}