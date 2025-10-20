import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MeAdote - Home'),
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context, '/profile'), icon: Icon(Icons.person))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Hero card
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Encontre seu novo amigo', style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(height: 8),
                    Text('Navegue pelos perfis e conheça animais disponíveis para adoção.', style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: CustomButton(label: 'Entrar', icon: Icons.login, onPressed: () => Navigator.pushNamed(context, '/login'))),
                        SizedBox(width: 12),
                        Expanded(child: CustomButton(label: 'Registrar', icon: Icons.app_registration, onPressed: () => Navigator.pushNamed(context, '/register'))),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            // Grid of feature cards (mocked)
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: List.generate(6, (index) {
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height: 90, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(8))),
                          SizedBox(height: 8),
                          Text('Pet #${index+1}', style: Theme.of(context).textTheme.titleMedium),
                          SizedBox(height: 4),
                          Text('Pequena descrição do pet', style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}