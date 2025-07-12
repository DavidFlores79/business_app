import 'package:business_app/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions; // Acciones adicionales (botones)
  final bool showBackButton; // Indica si se muestra el botón de retroceso
  final Color backgroundColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.backgroundColor = AppColors.transparent,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor, // Fondo blanco
      elevation: 0, // Sin sombra
      leading:
          showBackButton
              ? Container(
                margin: const EdgeInsets.only(
                  left: 10,
                ), // Espacio alrededor del botón
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.gray400, // Color del borde
                    width: 1.0, // Grosor del borde
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              )
              : null,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.gray800, // Texto negro
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true, // Centra el título
      actions: actions, // Agrega acciones opcionales
    );
  }
}
