import 'package:flutter/material.dart';
import '../../widgets/campo_text.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: SafeArea(child: Padding(padding: EdgeInsets.all(16), child: Column(children: [
        SizedBox(height:20),
        CircleAvatar(radius:44, backgroundColor: Color(0xFF3A3A3A)),
        SizedBox(height:12),
        Text('Bem vindo ao MeAdote', style: TextStyle(fontSize:18,fontWeight: FontWeight.bold)),
        SizedBox(height:8),
        Text('Acesse sua conta para continuar', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFB3B3B3))),
        SizedBox(height:12),
        CampoText(hint: 'Email', controller: email, keyboardType: TextInputType.emailAddress),
        SizedBox(height:8),
        CampoText(hint: 'Senha', controller: senha, obscure: true),
        SizedBox(height:8),
        Align(alignment: Alignment.centerRight, child: TextButton(onPressed: (){}, child: Text('Esqueceu a senha?'))),
        SizedBox(height:12),
        ElevatedButton(onPressed: (){}, child: Text('Entrar'), style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity,48), backgroundColor: Theme.of(context).elevatedButtonTheme.style?.backgroundColor?.resolve({}) ?? Color(0xFFA0A0A0), foregroundColor: Colors.black)),
        SizedBox(height:8),
        OutlinedButton(onPressed: (){}, child: Text('Criar conta')),
      ]))),
    );
  }
}
