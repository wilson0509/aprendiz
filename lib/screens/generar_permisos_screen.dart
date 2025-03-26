import 'package:flutter/material.dart';

class GenerarPermisosScreen extends StatefulWidget {
  const GenerarPermisosScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GenerarPermisosScreenState createState() => _GenerarPermisosScreenState();
}

class _GenerarPermisosScreenState extends State<GenerarPermisosScreen> {
  final _formKey = GlobalKey<FormState>();
  String _tipoPermiso = 'Salida';
  DateTime _fechaInicio = DateTime.now();
  DateTime _fechaFin = DateTime.now();
  String _motivo = '';

  final List<String> _tiposPermisos = [
    'Salida',
    'Ausencia',
    'Académico',
    'Médico',
  ];

  Future<void> _seleccionarFecha(bool esInicio) async {
    final fecha = await showDatePicker(
      context: context,
      initialDate: esInicio ? _fechaInicio : _fechaFin,
      firstDate: DateTime(2024),
      lastDate: DateTime(2026),
    );

    if (fecha != null) {
      setState(() {
        esInicio ? _fechaInicio = fecha : _fechaFin = fecha;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generar Permisos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                value: _tipoPermiso,
                decoration: const InputDecoration(
                  labelText: 'Tipo de Permiso',
                ),
                items: _tiposPermisos
                    .map((tipo) => DropdownMenuItem(
                          value: tipo,
                          child: Text(tipo),
                        ))
                    .toList(),
                onChanged: (valor) {
                  setState(() {
                    _tipoPermiso = valor!;
                  });
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: 'Fecha de Inicio',
                      ),
                      controller: TextEditingController(
                        text: _fechaInicio.toString().split(' ')[0],
                      ),
                      onTap: () => _seleccionarFecha(true),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: 'Fecha de Fin',
                      ),
                      controller: TextEditingController(
                        text: _fechaFin.toString().split(' ')[0],
                      ),
                      onTap: () => _seleccionarFecha(false),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Motivo del Permiso',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Por favor ingrese un motivo';
                  }
                  return null;
                },
                onSaved: (valor) {
                  _motivo = valor!;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _enviarPermiso,
                child: const Text('Solicitar Permiso'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _enviarPermiso() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      
      

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Permiso solicitado: $_tipoPermiso'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }
}