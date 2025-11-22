import 'package:flutter/material.dart';
import '../modelos/tarefa.dart';
import '../componentes/componente_tarefa.dart';

class TelaListaTarefas extends StatefulWidget {
  final String? novaTarefa;

  TelaListaTarefas({this.novaTarefa});

  // Lista estática que não se perde enquanto o app está aberto
  static List<Tarefa> tarefasSalvas = [];

  @override
  _TelaListaTarefasState createState() => _TelaListaTarefasState();
}

class _TelaListaTarefasState extends State<TelaListaTarefas> {
  String filtro = "Todas";
  DateTime dataAtual = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.novaTarefa != null && widget.novaTarefa!.isNotEmpty) {
      TelaListaTarefas.tarefasSalvas.add(Tarefa(titulo: widget.novaTarefa!));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Tarefa> tarefasFiltradas = TelaListaTarefas.tarefasSalvas.where((t) {
      if (filtro == "Feitas") return t.concluida;
      if (filtro == "Não Feitas") return !t.concluida;
      return true;
    }).toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.blue,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Lista de Tarefas", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text("Guilherme Henrique de Paiva Queiroz - RA: 1160742", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Dia ${dataAtual.day}/${dataAtual.month}/${dataAtual.year}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Filtrar:", style: TextStyle(fontSize: 16)),
              SizedBox(width: 10),
              DropdownButton<String>(
                value: filtro,
                items: ["Todas", "Feitas", "Não Feitas"].map((f) {
                  return DropdownMenuItem(value: f, child: Text(f));
                }).toList(),
                onChanged: (valor) {
                  setState(() {
                    filtro = valor!;
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: tarefasFiltradas.isEmpty
                ? Center(child: Text("Nenhuma tarefa encontrada"))
                : ListView.builder(
              itemCount: tarefasFiltradas.length,
              itemBuilder: (context, index) {
                final tarefa = tarefasFiltradas[index];
                return ComponenteTarefa(
                  tarefa: tarefa,
                  aoAlternar: () {
                    setState(() {
                      tarefa.concluida = !tarefa.concluida;
                    });
                  },
                  aoExcluir: () {
                    setState(() {
                      TelaListaTarefas.tarefasSalvas.remove(tarefa);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
