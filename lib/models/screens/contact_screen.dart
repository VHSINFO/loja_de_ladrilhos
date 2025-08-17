import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  // Função para abrir links
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Não foi possível abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contato'),
        backgroundColor: Colors.blue[800],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue,
            child: Icon(Icons.store, size: 60, color: Colors.white),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Entre em Contato',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              leading: const Icon(Icons.phone, color: Colors.blue),
              title: const Text('Telefone'),
              subtitle: const Text('+55 (00) 12345-6789'),
              onTap: () => _launchURL('tel:+5500123456789'),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              leading: const Icon(Icons.email, color: Colors.blue),
              title: const Text('E-mail'),
              subtitle: const Text('contato@lojadeladrilhos.com'),
              onTap: () => _launchURL('mailto:contato@lojadeladrilhos.com'),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              leading: const Icon(Icons.location_on, color: Colors.blue),
              title: const Text('Endereço'),
              subtitle: const Text('Rua dos Ladrilhos, 123 - Centro'),
              onTap: () {
                // Adicionar link para o mapa se desejar
              },
            ),
          ),
        ],
      ),
    );
  }
}