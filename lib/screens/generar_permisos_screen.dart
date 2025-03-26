import 'package:flutter/material.dart';

class GenerarPermisosScreen extends StatefulWidget {
  const GenerarPermisosScreen({Key? key}) : super(key: key);

  @override
  _GenerarPermisosScreenState createState() => _GenerarPermisosScreenState();
}

class _GenerarPermisosScreenState extends State<GenerarPermisosScreen> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _documentoController = TextEditingController();
  final TextEditingController _motivoController = TextEditingController();
  DateTime? _fechaInicio;
  DateTime? _fechaFin;

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
      initialDateRange: _fechaInicio != null && _fechaFin != null
          ? DateTimeRange(start: _fechaInicio!, end: _fechaFin!)
          : null,
    );

    if (picked != null) {
      setState(() {
        _fechaInicio = picked.start;
        _fechaFin = picked.end;
      });
    }
  }

  void _enviarSolicitud() {
    // Mostrar diálogo de solicitud enviada
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/128/6115/6115001.png', 
              height: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            const Text(
              'Solicitud Enviada',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Su solicitud ha sido enviada exitosamente',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
              Navigator.of(context).pop(); // Regresar a la pantalla anterior
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Generar Permiso', 
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Solicitud de Permiso',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombres y Apellidos',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _documentoController,
                decoration: InputDecoration(
                  labelText: 'C.C. No',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () => _selectDateRange(context),
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Fecha de Permiso',
                      hintText: _fechaInicio != null && _fechaFin != null
                          ? '${_fechaInicio!.day}/${_fechaInicio!.month}/${_fechaInicio!.year} - ${_fechaFin!.day}/${_fechaFin!.month}/${_fechaFin!.year}'
                          : 'Seleccionar fechas',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: const Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _motivoController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Motivo del Permiso',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _enviarSolicitud,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Enviar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}