import 'package:flutter/material.dart';

class PantallaNotificaciones extends StatelessWidget {
  const PantallaNotificaciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Notificaciones",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      body: ListView(
        children: [
          _notiItem(
            icon: Icons.chat_bubble_outline,
            color: Colors.blue.shade200,
            titulo: "Juan Pérez ha respondido a tu mensaje sobre el Ford Focus.",
            tiempo: "Hace 5 min",
          ),

          _notiItem(
            icon: Icons.price_change_outlined,
            color: Colors.purple.shade200,
            titulo: "¡Bajada de precio! El Volkswagen Golf que te gusta ahora cuesta \$12,900.",
            tiempo: "Hace 1 hora",
          ),

          _notiItem(
            icon: Icons.search_outlined,
            color: Colors.grey.shade300,
            titulo: "¡Nuevo anuncio! Un Seat León coincide con tu búsqueda guardada.",
            tiempo: "Ayer",
          ),

          _notiItem(
            icon: Icons.directions_car,
            color: Colors.grey.shade400,
            titulo: "El Toyota Corolla que guardaste en favoritos ha sido vendido.",
            tiempo: "20/07/2024",
          ),

          const SizedBox(height: 20),

          const Center(
            child: Text(
              "Fin del listado de favoritos",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _notiItem({
    required IconData icon,
    required Color color,
    required String titulo,
    required String tiempo,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 22,
            child: Icon(icon, color: Colors.black),
          ),
          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 6),
                Text(
                  tiempo,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),

          const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        ],
      ),
    );
  }
}
