import 'package:flutter/material.dart';

class TareasDirigidasScreen extends StatefulWidget {
  const TareasDirigidasScreen({Key? key}) : super(key: key);

  @override
  _TareasDirigidasScreenState createState() => _TareasDirigidasScreenState();
}

class _TareasDirigidasScreenState extends State<TareasDirigidasScreen> {
  final List<Map<String, dynamic>> _tareas = [
    {
      'titulo': 'Informe Matemáticas',
      'descripcion': 'Preparar informe trimestral',
      'fecha': '20 Mar 2025',
      'completada': false
    },
    {
      'titulo': 'Proyecto de Ciencias',
      'descripcion': 'Desarrollar proyecto experimental',
      'fecha': '25 Mar 2025',
      'completada': false
    },
    {
      'titulo': 'Ensayo de Historia',
      'descripcion': 'Análisis de período histórico',
      'fecha': '15 Mar 2025',
      'completada': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tareas Dirigidas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _mostrarDialogoNuevaTarea,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _tareas.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(_tareas[index]['titulo']),
            subtitle: Text(_tareas[index]['descripcion']),
            secondary: Text(_tareas[index]['fecha']),
            value: _tareas[index]['completada'],
            onChanged: (bool? valor) {
              setState(() {
                _tareas[index]['completada'] = valor;
              });
            },
          );
        },
      ),
    );
  }

  void _mostrarDialogoNuevaTarea() {
    final tituloController = TextEditingController();
    final descripcionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nueva Tarea'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: tituloController,
              decoration: const InputDecoration(
                labelText: 'Título de la Tarea',
              ),
            ),
            TextField(
              controller: descripcionController,
              decoration: const InputDecoration(
                labelText: 'Descripción',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _tareas.add({
                  'titulo': tituloController.text,
                  'descripcion': descripcionController.text,
                  'fecha': DateTime.now().toString().split(' ')[0],
                  'completada': false
                });
              });
              Navigator.pop(context);
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}