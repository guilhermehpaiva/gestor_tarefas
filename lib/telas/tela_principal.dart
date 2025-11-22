import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'tela_login.dart';
import 'tela_lista_tarefas.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text("Gestor de Tarefas"),
            Text("Aluno: Guilherme Henrique de Paiva Queiroz - RA: 1160742", style: TextStyle(fontSize: 12)),
          ],
        ),
        backgroundColor: Colors.blue,
        actions: [
          TextButton(
            onPressed: () {
              showDialog(context: context, builder: (_) => TelaLogin());
            },
            child: Text("Efetuar Login", style: TextStyle(color: Colors.orange)),
          )
        ],
      ),
      body: Column(
        children: [
          // Calendário
          Expanded(
            child: TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                selectedDecoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
              ),
            ),
          ),
          // Campo para adicionar tarefa
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Digite uma nova tarefa",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => TelaListaTarefas(novaTarefa: controller.text)),
                    );
                  },
                  child: Text("Adicionar"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
