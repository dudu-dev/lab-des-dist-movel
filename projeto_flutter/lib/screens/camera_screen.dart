import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List<String> _photos = [];

  void _simulateTakePhoto() {
    setState(() {
      // Simula uma foto tirada gerando um ID único
      _photos.add('Photo_${DateTime.now().millisecondsSinceEpoch}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Câmera Simulada'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _photos.isEmpty
                ? Center(child: Text('Nenhuma foto tirada'))
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: _photos.length,
                    padding: EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.grey[300],
                        child: Center(
                          child: Text(
                            'Foto ${index + 1}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _simulateTakePhoto,
              child: Text('Tirar Foto'),
            ),
          ),
        ],
      ),
    );
  }
}