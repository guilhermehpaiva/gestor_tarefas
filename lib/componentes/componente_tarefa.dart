import 'package:flutter/material.dart';
import '../modelos/tarefa.dart';

class ComponenteTarefa extends StatelessWidget {
  final Tarefa tarefa;
  final VoidCallback aoAlternar;
  final VoidCallback aoExcluir;

  const ComponenteTarefa({
    Key? key,
    required this.tarefa,
    required this.aoAlternar,
    required this.aoExcluir,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: tarefa.concluida ? Colors.orange[100] : Colors.blue[100],
      child: ListTile(
        title: Text(
          tarefa.titulo,
          style: TextStyle(
            decoration: tarefa.concluida ? TextDecoration.lineThrough : null,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            tarefa.concluida ? Icons.check_circle : Icons.circle_outlined,
            color: tarefa.concluida ? Colors.orange : Colors.blue,
          ),
          onPressed: aoAlternar,
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.black),
          onPressed: aoExcluir,
        ),
      ),
    );
  }
}
