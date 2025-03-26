import 'package:admin_app/screens/tareas_dirigida_screen.dart';
import 'package:flutter/material.dart';
import 'reportes_screen.dart';
import 'manual_convivencia_screen.dart';
import 'generar_permisos_screen.dart';
import 'casino_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Barra superior
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Camilo Hernandez',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications_outlined),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.person_outline,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Contenido principal
            Expanded(
              child: Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildCustomButton(
                      context,
                      Icons.report,
                      'Mis reportes',
                      const ReportesScreen(),
                    ),
                    _buildCustomButton(
                      context,
                      Icons.book_outlined,
                      'Manual de\nconvivencia',
                      const ManualConvivenciaScreen(),
                    ),
                    _buildCustomButton(
                      context,
                      Icons.task_outlined,
                      'Tareas\nDirigidas',
                      const TareasDirigidasScreen(),
                    ),
                    _buildCustomButton(
                      context,
                      Icons.spatial_audio_sharp,
                      'Generar\npermiso',
                      const GenerarPermisosScreen(),
                    ),
                    _buildCustomButton(
                      context,
                      Icons.casino_outlined,
                      'Casino',
                      const CasinoScreen(),
                    ),
                  ],
                ),
              ),
            ),

            // Barra de navegación inferior
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                selectedItemColor: Colors.green,
                unselectedItemColor: Colors.grey,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: 'Inicio',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    label: 'Perfil',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings_outlined),
                    label: 'Configuración',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomButton(
    BuildContext context, 
    IconData icon, 
    String label, 
    Widget screen,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}