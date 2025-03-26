import 'package:flutter/material.dart';

class ReportesScreen extends StatelessWidget {
  const ReportesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Reportes'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildReporteCard('Reporte de Disciplina', '15 Mar 2025'),
          _buildReporteCard('Reporte Académico', '10 Mar 2025'),
          _buildReporteCard('Reporte de Asistencia', '05 Mar 2025'),
        ],
      ),
    );
  }

  Widget _buildReporteCard(String titulo, String fecha) {
    return Card(
      child: ListTile(
        title: Text(titulo),
        subtitle: Text(fecha),
        trailing: const Icon(Icons.visibility),
        onTap: () {
          // TODO: Implementar visualización de reporte
        },
      ),
    );
  }
}