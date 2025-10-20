import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            SizedBox(height: 12),
            TextField(decoration: InputDecoration(labelText: 'E-mail', border: OutlineInputBorder())),
            SizedBox(height: 12),
            TextField(decoration: InputDecoration(labelText: 'Senha', border: OutlineInputBorder()), obscureText: true),
            SizedBox(height: 18),
            CustomButton(label: 'Entrar', icon: Icons.login, onPressed: () {}),
            SizedBox(height: 12),
            TextButton(onPressed: () => Navigator.pushNamed(context, '/register'), child: Text('Criar uma conta'))
          ],
        ),
      ),
    );
  }
}