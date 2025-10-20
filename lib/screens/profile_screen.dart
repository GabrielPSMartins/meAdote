import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            CircleAvatar(radius: 44, backgroundColor: Colors.grey[300], child: Icon(Icons.person, size: 44, color: Colors.white)),
            SizedBox(height: 12),
            Text('Nome do Usuário', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 6),
            Text('Cidade, Estado', style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 18),
            Card(
              child: ListTile(
                leading: Icon(Icons.pets),
                title: Text('Meus pets favoritos'),
                subtitle: Text('Lista mockada de pets que você salvou'),
              ),
            ),
            SizedBox(height: 12),
            CustomButton(label: 'Editar perfil', icon: Icons.edit, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}