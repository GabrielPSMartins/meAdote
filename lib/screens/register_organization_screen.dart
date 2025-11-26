import 'package:flutter/material.dart';

import '../../models/ong.dart';
import '../../repositories/ong_repository.dart';

class RegisterOrganizationScreen extends StatefulWidget {
  const RegisterOrganizationScreen({super.key});

  @override
  State<RegisterOrganizationScreen> createState() =>
      _RegisterOrganizationScreenState();
}

class _RegisterOrganizationScreenState
    extends State<RegisterOrganizationScreen> {
  bool acceptedTerms = false;
  String? _selectedType;

  // ------------------ CONTROLLERS ------------------
  final orgNome = TextEditingController();
  final orgCnpj = TextEditingController();
  final orgDescricao = TextEditingController();
  final orgEndereco = TextEditingController();
  final orgSite = TextEditingController();

  final respNome = TextEditingController();
  final respEmail = TextEditingController();
  final respTelefone = TextEditingController();
  final respSenha = TextEditingController();
  final respConfirmarSenha = TextEditingController();

  // ------------------ SNACKBAR ERRO ------------------
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
            Expanded(child: Text(msg, style: const TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }

  // ------------------ SNACKBAR SUCESSO ------------------
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
            Expanded(child: Text(msg, style: const TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }

  // ------------------ SALVAR ORGANIZAÇÃO NO BANCO ------------------
  Future<void> _validateAndSubmit() async {
    // --- VALIDAÇÕES ---
    if (orgNome.text.trim().isEmpty) return _showError("Preencha o nome da organização.");
    if (orgCnpj.text.trim().isEmpty) return _showError("Informe o CNPJ.");
    if (_selectedType == null) return _showError("Selecione o tipo da organização.");

    if (respNome.text.trim().isEmpty) return _showError("Preencha o nome do responsável.");
    if (!respEmail.text.contains("@")) return _showError("Digite um email válido.");
    if (respTelefone.text.length < 8) return _showError("Telefone inválido.");

    if (respSenha.text.length < 6) {
      return _showError("A senha deve ter pelo menos 6 caracteres.");
    }
    if (respSenha.text != respConfirmarSenha.text) {
      return _showError("As senhas não coincidem.");
    }

    if (!acceptedTerms) {
      return _showError("Você precisa aceitar os termos.");
    }

    // ------------------ CRIAR OBJETO ONG ------------------
    final ong = Ong(
      name: orgNome.text.trim(),
      email: respEmail.text.trim(),
      password: respSenha.text.trim(),
      city: orgEndereco.text.trim(),
      imageUrl: "", // futuramente você pode salvar foto
    );

    // ------------------ SALVAR NO BANCO SQLITE ------------------
    final repo = OngRepository();
    await repo.createOng(ong);

    _showSuccess("Organização cadastrada com sucesso!");

    // REDIRECIONAR PARA LOGIN
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
          "Cadastro ONG/Protetor",
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ----------- CARD SUPERIOR ---------------
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
                    child: Icon(Icons.apartment, size: 42, color: Colors.white),
                  ),
                  SizedBox(height: 14),
                  Text(
                    "Cadastrar Organização",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Cadastre sua ONG ou trabalho independente para conectar animais a famílias.",
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

            // ---------- BOTÕES DE SELEÇÃO ----------
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.pushReplacementNamed(context, '/register'),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3A3A3A),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white24),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Adotante",
                        style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "ONG/Protetor",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ---------- FORM CARD ----------
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
                  const Text(
                    "Dados da Organização",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 14),

                  _input("Nome da Organização *", Icons.apartment, orgNome,
                      "ONG Amigos dos Animais"),
                  _gap(),

                  Row(
                    children: [
                      Expanded(
                        child: _input("CNPJ *", Icons.badge, orgCnpj,
                            "00.000.000/0001-00"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: _tipoDropdown()),
                    ],
                  ),
                  _gap(),

                  _input(
                    "Descrição da Organização",
                    Icons.description,
                    orgDescricao,
                    "Conte um pouco sobre a ONG.",
                  ),
                  _gap(),

                  _input("Endereço Completo", Icons.location_on, orgEndereco,
                      "Rua, número, bairro, cidade - UF"),
                  _gap(),

                  _input("Site / Instagram (opcional)", Icons.public, orgSite,
                      "www.seusite.com / @instagram"),
                  _gap(),

                  const Divider(height: 32, color: Colors.white24),

                  const Text(
                    "Dados do Responsável",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 14),

                  _input(
                      "Nome Completo *", Icons.person, respNome, "Seu nome completo"),
                  _gap(),

                  _input(
                      "Email *", Icons.email, respEmail, "seuemail@exemplo.com"),
                  _gap(),

                  _input("Telefone *", Icons.phone, respTelefone,
                      "(11) 99999-9999"),
                  _gap(),

                  _input("Senha *", Icons.lock, respSenha, "Crie uma senha segura",
                      obscure: true),
                  _gap(),

                  _input("Confirmar Senha *", Icons.lock, respConfirmarSenha,
                      "Repita a senha",
                      obscure: true),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // ---------- TERMOS ----------
            Row(
              children: [
                Checkbox(
                  value: acceptedTerms,
                  onChanged: (v) => setState(() => acceptedTerms = v!),
                  checkColor: Colors.black,
                  activeColor: primary,
                ),
                Expanded(
                  child: Text(
                    "Aceito os termos e condições.",
                    style: const TextStyle(fontSize: 13, color: Colors.white70),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // ---------- BOTÃO CRIAR CONTA ----------
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

  // -------- INPUT PADRÃO ----------
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

  // -------- DROPDOWN TIPO ----------
  Widget _tipoDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Tipo",
          style: TextStyle(fontSize: 13, color: Colors.white70),
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: _selectedType,
          dropdownColor: const Color(0xFF121212),
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF121212),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white12),
            ),
          ),
          hint: const Text(
            "Selecione",
            style: TextStyle(color: Colors.white38, fontSize: 13),
          ),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white70),
          items: const [
            DropdownMenuItem(
              value: 'ong',
              child: Text("ONG"),
            ),
            DropdownMenuItem(
              value: 'protetor',
              child: Text("Protetor independente"),
            ),
          ],
          onChanged: (value) => setState(() => _selectedType = value),
        ),
      ],
    );
  }

  Widget _gap() => const SizedBox(height: 14);
}
