import 'package:flutter/material.dart';
import 'package:flutter_app/screens/camera_screen.dart';

import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/location_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recursos Nativos Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        // Personalização de cards
        cardTheme: CardTheme(
          elevation: 2,
          margin: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        // Personalização de botões
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        // Personalização de AppBar
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        // Personalização de textos
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            height: 1.5,
          ),
        ),
      ),
      // Configuração de tema escuro
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      // Usar as configurações do sistema para tema claro/escuro
      themeMode: ThemeMode.system,
      
      // Configuração de rotas
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/location': (context) => LocationScreen(),
        '/camera': (context) => CameraScreen(),
      },
      
      // Tratamento de rotas não encontradas
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text('Erro'),
            ),
            body: Center(
              child: Text('Página não encontrada'),
            ),
          ),
        );
      },
      
      // Configurações de scroll
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}

// Opcional: Provider para gerenciamento de estado global
class AppState extends ChangeNotifier {
  // Exemplo de estado global para histórico de localizações
  List<Map<String, double>> _locationHistory = [];
  
  List<Map<String, double>> get locationHistory => _locationHistory;
  
  void addLocation(double latitude, double longitude) {
    _locationHistory.add({
      'latitude': latitude,
      'longitude': longitude,
    });
    notifyListeners();
  }
  
  // Exemplo de estado global para fotos
  List<String> _photos = [];
  
  List<String> get photos => _photos;
  
  void addPhoto(String photoId) {
    _photos.add(photoId);
    notifyListeners();
  }
  
  // Limpar todos os dados
  void clearAll() {
    _locationHistory.clear();
    _photos.clear();
    notifyListeners();
  }
}