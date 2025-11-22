import 'package:flutter/material.dart';

class TelaLogin extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Efetuar Login"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
          SizedBox(height: 10),
          TextField(controller: senhaController, obscureText: true, decoration: InputDecoration(labelText: "Senha")),
        ],
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          onPressed: () => Navigator.pop(context),
          child: Text("Entrar"),
        ),
      ],
    );
  }
}
