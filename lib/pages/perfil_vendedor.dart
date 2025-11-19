import 'package:flutter/material.dart';

class PerfilVendedor extends StatelessWidget {
  const PerfilVendedor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Mi Perfil de Vendedor",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // DATOS DEL USUARIO
            Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage("assets/imagenes/perfil.jpg"),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Luis Urquiaga",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Miembro desde 2025",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(height: 20),

            // CLASIFICACIÓN
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: const [
                  Icon(Icons.star_border, color: Colors.amber, size: 30),
                  Icon(Icons.star_border, color: Colors.amber, size: 30),
                  Icon(Icons.star_border, color: Colors.amber, size: 30),
                  Icon(Icons.star_border, color: Colors.amber, size: 30),
                  Icon(Icons.star_border, color: Colors.amber, size: 30),
                  SizedBox(width: 10),
                  Text(
                    "Sin Clasificaciones aún",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // BADGES DE CONFIANZA
            const Text(
              "Badges de Confianza",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade200,
                    ),
                    alignment: Alignment.center,
                    child: const Text("sin badges aún"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ESTADÍSTICAS
            const Text(
              "Estadísticas del Vendedor",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _statBox("0", "Coches Vendidos"),
                _statBox("N/A", "Tiempo Respuesta"),
                _statBox("N/A", "Ratio Respuesta"),
              ],
            ),

            const SizedBox(height: 10),
            const Center(
              child: Text(
                "Aún no tienes ventas registradas",
                style: TextStyle(color: Colors.grey),
              ),
            ),

            const SizedBox(height: 20),

            // RESEÑAS
            const Text(
              "Reseñas de Compradores",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200,
              ),
              child: Column(
                children: const [
                  Icon(Icons.chat_bubble_outline, size: 40, color: Colors.grey),
                  SizedBox(height: 10),
                  Text(
                    "Nadie ha dejado reseñas aún.",
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text(
                    "¡Publica tu primer coche para comenzar a construir tu reputación!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // VEHÍCULOS EN VENTA
            const Text(
              "Mis Vehículos en venta",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200,
              ),
              child: Column(
                children: [
                  const Icon(Icons.directions_car, size: 40, color: Colors.grey),
                  const SizedBox(height: 10),
                  const Text(
                    "Aún no tienes vehículos publicados a la venta.",
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text("Publicar tu primer coche"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _statBox(String value, String label) {
    return Container(
      width: 110,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
