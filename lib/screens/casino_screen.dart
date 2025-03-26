import 'package:flutter/material.dart';

class CasinoScreen extends StatefulWidget {
  const CasinoScreen({Key? key}) : super(key: key);

  @override
  _CasinoScreenState createState() => _CasinoScreenState();
}

class _CasinoScreenState extends State<CasinoScreen> {
  bool _breakfastConfirmed = false;
  bool _lunchConfirmed = false;
  bool _dinnerConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmar casino'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildMealConfirmationRow('Desayuno', _breakfastConfirmed, () {
              setState(() {
                _breakfastConfirmed = !_breakfastConfirmed;
                if (_breakfastConfirmed) {
                  _showConfirmationDialog();
                }
              });
            }),
            const SizedBox(height: 16),
            _buildMealConfirmationRow('Almuerzo', _lunchConfirmed, () {
              setState(() {
                _lunchConfirmed = !_lunchConfirmed;
                if (_lunchConfirmed) {
                  _showConfirmationDialog();
                }
              });
            }),
            const SizedBox(height: 16),
            _buildMealConfirmationRow('Cena', _dinnerConfirmed, () {
              setState(() {
                _dinnerConfirmed = !_dinnerConfirmed;
                if (_dinnerConfirmed) {
                  _showConfirmationDialog();
                }
              });
            }),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://cdn-icons-png.flaticon.com/128/6115/6115001.png', 
                height: 100,
                color: Colors.green,
              ),
              const SizedBox(height: 10),
              const Text(
                'La Confirmación a sido enviado exitosamente',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMealConfirmationRow(
    String mealName, 
    bool isConfirmed, 
    VoidCallback onTap
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isConfirmed ? Colors.green : Colors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              mealName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isConfirmed ? Colors.green : Colors.black,
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isConfirmed ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  isConfirmed ? 'Confirmar' : 'Solicitar',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}