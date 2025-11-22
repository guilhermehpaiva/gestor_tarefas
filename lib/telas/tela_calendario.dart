import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'tela_login.dart';
import 'tela_lista_tarefas.dart';

class TelaCalendario extends StatefulWidget {
  @override
  _TelaCalendarioState createState() => _TelaCalendarioState();
}

class _TelaCalendarioState extends State<TelaCalendario> {
  TextEditingController controller = TextEditingController();
  DateTime dataSelecionada = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.blue,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Bem-vindo, Guilherme Henrique de Paiva Queiroz", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text("RA: 1160742", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                icon: Icon(Icons.login),
                label: Text("Login"),
                onPressed: () => showDialog(context: context, builder: (_) => TelaLogin()),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: dataSelecionada,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            selectedDayPredicate: (day) => isSameDay(day, dataSelecionada),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                dataSelecionada = selectedDay;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
              selectedDecoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Data selecionada: ${dataSelecionada.day}/${dataSelecionada.month}/${dataSelecionada.year}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                      MaterialPageRoute(
                        builder: (_) => TelaListaTarefas(novaTarefa: controller.text),
                      ),
                    );
                  },
                  child: Text("Adicionar"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              icon: Icon(Icons.list),
              label: Text("Ver Lista de Tarefas"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => TelaListaTarefas()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
