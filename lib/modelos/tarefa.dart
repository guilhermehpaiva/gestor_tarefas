class Tarefa {
  String titulo;
  bool concluida;

  Tarefa({required this.titulo, this.concluida = false});

  // Converte para Map (para salvar em JSON futuramente)
  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'concluida': concluida,
    };
  }

  // Construtor a partir de Map
  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      titulo: map['titulo'],
      concluida: map['concluida'],
    );
  }
}
