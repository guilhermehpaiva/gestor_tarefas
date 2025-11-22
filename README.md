#  Gestor de Tarefas

Este projeto foi desenvolvido em Flutter com o objetivo de criar um **aplicativo simples de gestão de tarefas**.  
A ideia é ter um espaço organizado onde o usuário pode **adicionar, visualizar, filtrar e concluir tarefas**, tudo em uma interface clara e funcional.

---

##  O que o app faz
- Tela de **Login** para entrada inicial
- Tela de **Calendário** para selecionar datas
- Campo para **adicionar novas tarefas**
- Tela de **Lista de Tarefas** com:
  - Filtro (Todas, Feitas, Não Feitas)
  - Botão para marcar como concluída
  - Botão para excluir tarefa
- Nome e RA do aluno aparecem em destaque no app

---

##  Estrutura
O código foi separado em arquivos para facilitar a organização:
- `main.dart` → inicialização do app e tema
- `modelos/tarefa.dart` - classe que representa cada tarefa
- `componentes/componente_tarefa.dart` - widget para exibir uma tarefa
- `telas/` - telas principais (login, calendário, lista de tarefas)

---

##  Visual
- **Azul** como cor principal (AppBar, destaques)  
- **Laranja** como cor secundária (botões)  
- Layout simples, direto e fácil de usar

---

##  Autor
- **Aluno:** Guilherme Paiva
