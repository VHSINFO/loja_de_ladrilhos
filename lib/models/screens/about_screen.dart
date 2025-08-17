import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre a Empresa'),
        backgroundColor: Colors.blue[800],
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nossa História',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Fundada em 2024, a Loja de Ladrilhos nasceu da paixão por design e da vontade de oferecer os melhores revestimentos do mercado. Trazemos uma seleção cuidadosa de produtos que combinam qualidade, beleza e durabilidade para transformar qualquer ambiente.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 30),
            Text(
              'Nossa Missão',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Nossa missão é ajudar você a construir o espaço dos seus sonhos, oferecendo produtos de alta qualidade, atendimento especializado e inspiração para seus projetos. Acreditamos que cada ladrilho conta uma história e queremos fazer parte da sua.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
             SizedBox(height: 30),
            Text(
              'Nossos Valores',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
             ListTile(
              leading: Icon(Icons.check_circle_outline, color: Colors.blue),
              title: Text('Qualidade e Inovação'),
            ),
             ListTile(
              leading: Icon(Icons.check_circle_outline, color: Colors.blue),
              title: Text('Paixão pelo Cliente'),
            ),
             ListTile(
              leading: Icon(Icons.check_circle_outline, color: Colors.blue),
              title: Text('Sustentabilidade'),
            ),
          ],
        ),
      ),
    );
  }
}