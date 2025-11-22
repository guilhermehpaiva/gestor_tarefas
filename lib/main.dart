import 'package:flutter/material.dart';
import 'telas/tela_calendario.dart';

void main() {
  runApp(GestorTarefasApp());
}

class GestorTarefasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestor de Tarefas',
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue,
          secondary: Colors.orange,
        ),
      ),
      home: TelaCalendario(),
    );
  }
}
