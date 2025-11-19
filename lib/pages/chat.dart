import 'package:flutter/material.dart';

class PantallaChats extends StatelessWidget {
  const PantallaChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Datos en Tiempo Real",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.pause, color: Colors.black),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // BUSCADOR
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.black54),
                  hintText: "Buscar en mis chats...",
                ),
              ),
            ),

            const SizedBox(height: 20),

            // CHAT EJEMPLO
            Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage("assets/imagenes/hombre1.jpg"),
                ),
                const SizedBox(width: 12),

                // NOMBRE + MENSAJE
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Juan Pérez",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Claro ahí te pasaré los detalles que me pides apart...",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),

                // TIEMPO + MENSAJES NO LEÍDOS
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Hace 5 min",
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
