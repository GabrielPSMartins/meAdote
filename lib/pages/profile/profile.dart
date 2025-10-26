import 'package:flutter/material.dart';
import '../../nucleo/control_tema.dart';
import '../../pages/login/login.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/147/147144.png',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'João Silva',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Verificado',
                        style: TextStyle(
                          color: Color(0xFFB3B3B3),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.verified, color: Colors.green),
                ],
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Editar Perfil'),
              ),
              const SizedBox(height: 12),
              ListTile(
                title: const Text('Tema'),
                subtitle: const Text('Alternar entre claro e escuro'),
                trailing: ValueListenableBuilder(
                  valueListenable: temaController,
                  builder: (_, mode, __) {
                    final isDark = temaController.value == ThemeMode.dark;
                    return Switch(
                      value: isDark,
                      onChanged: (val) {
                        temaController.value =
                            isDark ? ThemeMode.light : ThemeMode.dark;
                      },
                    );
                  },
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.favorite_border),
                      title: Text('Favoritos'),
                    ),
                    const Divider(),
                    const ListTile(
                      leading: Icon(Icons.volunteer_activism_outlined),
                      title: Text('Apoiar'),
                    ),
                    const Divider(),
                    const ListTile(
                      leading: Icon(Icons.notifications_none),
                      title: Text('Notificações'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                    const Divider(),
                    const ListTile(
                      leading: Icon(Icons.settings_outlined),
                      title: Text('Configurações'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.exit_to_app),
                      title: const Text('Sair'),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}