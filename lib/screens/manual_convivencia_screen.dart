import 'package:flutter/material.dart';

class ManualConvivenciaScreen extends StatelessWidget {
  const ManualConvivenciaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manual de Convivencia'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSeccionCard('Derechos', Icons.check_circle_outline),
          _buildSeccionCard('Deberes', Icons.assignment),
          _buildSeccionCard('Sanciones', Icons.warning),
          _buildSeccionCard('Procedimientos', Icons.list_alt),
        ],
      ),
    );
  }

  Widget _buildSeccionCard(String titulo, IconData icono) {
    return Card(
      child: ListTile(
        leading: Icon(icono, color: Colors.green),
        title: Text(titulo),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // TODO: Implementar detalle de sección
        },
      ),
    );
  }
}