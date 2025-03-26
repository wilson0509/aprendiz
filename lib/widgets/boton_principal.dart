import 'package:flutter/material.dart';

class BotonPrincipal extends StatelessWidget {
  final IconData icono;
  final String texto;
  final VoidCallback onTap;

  const BotonPrincipal({
    Key? key,
    required this.icono,
    required this.texto,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icono, size: 50, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              texto,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}