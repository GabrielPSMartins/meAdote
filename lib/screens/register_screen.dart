import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(decoration: InputDecoration(labelText: 'Nome', border: OutlineInputBorder())),
              SizedBox(height: 12),
              TextField(decoration: InputDecoration(labelText: 'E-mail', border: OutlineInputBorder())),
              SizedBox(height: 12),
              TextField(decoration: InputDecoration(labelText: 'Senha', border: OutlineInputBorder()), obscureText: true),
              SizedBox(height: 12),
              TextField(decoration: InputDecoration(labelText: 'Confirmar senha', border: OutlineInputBorder()), obscureText: true),
              SizedBox(height: 18),
              CustomButton(label: 'Criar conta', icon: Icons.check, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}