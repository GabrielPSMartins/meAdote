import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // ------------------ CONTROLLERS ------------------
  final nome = TextEditingController();
  final email = TextEditingController();
  final telefone = TextEditingController();
  final nascimento = TextEditingController();
  final cidade = TextEditingController();
  final estado = TextEditingController();
  final senha = TextEditingController();
  final confirmarSenha = TextEditingController();

  bool acceptedTerms = false;

  // ------------------ SNACKBAR DE ERRO ------------------
  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent.shade200,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(msg, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------ SNACKBAR DE SUCESSO ------------------
  void _showSuccess(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green.shade600,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(msg, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------ VALIDAÇÃO ------------------
  Future<void> _validateAndSubmit() async {
    if (nome.text.trim().isEmpty) return _showError("Preencha o nome completo.");
    if (email.text.isEmpty || !email.text.contains("@")) {
      return _showError("Digite um email válido.");
    }
    if (telefone.text.length < 8) return _showError("Telefone inválido.");

    if (senha.text.length < 6) {
      return _showError("A senha deve ter pelo menos 6 caracteres.");
    }

    if (senha.text != confirmarSenha.text) {
      return _showError("As senhas não coincidem.");
    }

    if (!acceptedTerms) {
      return _showError("Você precisa aceitar os termos.");
    }
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', nome.text.trim());
    await prefs.setString('email', email.text.trim());
    await prefs.setString('senha', senha.text.trim());

    _showSuccess("Conta criada com sucesso!");

    Future.delayed(const Duration(milliseconds: 900), () {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFFB89278);
    const bgDark = Color(0xFF1F1A17);
    const cardDark = Color(0xFF1D1D1D);

    return Scaffold(
      backgroundColor: bgDark,
      appBar: AppBar(
        backgroundColor: bgDark,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 22, color: Colors.white70),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Criar conta",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white70,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            // --------- CARD SUPERIOR ---------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardDark,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white12),
              ),
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 42,
                    backgroundColor: Color(0xFF2C59C1),
                    child: Icon(Icons.person, size: 42, color: Colors.white),
                  ),
                  SizedBox(height: 14),
                  Text(
                    "Criar sua conta",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Conecte-se com ONGs e encontre seu novo companheiro.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 6),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // --------- BOTÕES ADOTANTE / ONG ---------
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Adotante",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/register_org',
                      );
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3A3A3A),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white24),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "ONG/Protetor",
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // --------- CARD DO FORM ---------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardDark,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _input("Nome Completo *", Icons.person, nome, "Seu nome completo"),
                  _gap(),
                  _input("Email *", Icons.email, email, "seuemail@exemplo.com"),
                  _gap(),
                  _input("Telefone *", Icons.phone, telefone, "(11) 99999-9999"),
                  _gap(),
                  _input("Data de Nascimento", Icons.calendar_today, nascimento, "dd/mm/aaaa"),
                  _gap(),
                  Row(
                    children: [
                      Expanded(
                        child: _input("Cidade", Icons.location_city, cidade, "Sua cidade"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _input("Estado", Icons.map, estado, "UF"),
                      ),
                    ],
                  ),
                  _gap(),
                  _input("Senha *", Icons.lock, senha, "Crie uma senha segura", obscure: true),
                  _gap(),
                  _input("Confirmar Senha *", Icons.lock, confirmarSenha, "Repita a senha",
                      obscure: true),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // --------- TERMOS ---------
            Row(
              children: [
                Checkbox(
                  value: acceptedTerms,
                  onChanged: (v) => setState(() => acceptedTerms = v!),
                  checkColor: Colors.black,
                  activeColor: primary,
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "Aceito os termos e condições.\n",
                      style: const TextStyle(fontSize: 13, color: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // --------- BOTÃO CRIAR CONTA ---------
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _validateAndSubmit,
                child: const Text(
                  "Criar Conta",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ---------- INPUT PADRÃO -----------
  Widget _input(String label, IconData icon, TextEditingController controller,
      String hintText,
      {bool obscure = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 13, color: Colors.white70)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: obscure,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF121212),
            prefixIcon: Icon(icon, color: Colors.white54),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white38, fontSize: 13),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _gap() => const SizedBox(height: 14);
}
