import 'package:esodecarros/pages/notificacion.dart';
import 'package:esodecarros/pages/perfil.dart';
import 'package:flutter/material.dart';

class PantallaInicial extends StatefulWidget {
  const PantallaInicial({super.key});

  @override
  State<PantallaInicial> createState() => _PantallaInicialState();
}

class _PantallaInicialState extends State<PantallaInicial> {
  int _paginaActual = 0;

 //lista de los autos precargados xd
  final List<Map<String, dynamic>> autos = [
    {
      "titulo": "Toyota Land Cruiser Prado 2022",
      "precio": "\$43,900 - S/150,050",
      "detalles": "115,000 km - Automático",
      "img": "assets/imagenes/auto.png",
      "fav": false
    },
    {
      "titulo": "Porsche Macan 2024",
      "precio": "\$72,900 - S/249,172",
      "detalles": "10,000 km - PDK",
      "img": "assets/imagenes/auto.png",
      "fav": false
    },
    {
      "titulo": "Mitsubishi Montero 2008",
      "precio": "\$19,270 - S/65,000",
      "detalles": "204,000 km - Automático",
      "img": "assets/imagenes/auto.png",
      "fav": false
    },
    {
      "titulo": "Kia Sportage 2014",
      "precio": "\$16,300 - S/55,000",
      "detalles": "150,000 km - Automático",
      "img": "assets/imagenes/auto.png",
      "fav": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

 //bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: const [
            Text(
              "NEUMATIK",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Explorar",
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ],
        ),
        leading: const SizedBox(),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PantallaNotificaciones()),
              );
            },
          ),
        ],
      ),

//cuerpo dinamico
body: IndexedStack(
  index: _paginaActual,
  children: [
    _pantallaExplorar(),
    _pantallaFavoritos(),
    const PantallaPerfil(),
  ],
),

//menu interior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _paginaActual,
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() => _paginaActual = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favoritos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Perfil",
          ),
        ],
      ),
    );
  }

//la pantalla de explorar
  Widget _pantallaExplorar() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [

          // busqueda
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                hintText: "Buscar marca, modelo...",
                border: InputBorder.none,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // filtros
          Wrap(
            spacing: 10,
            children: [
              _chip("Filtrar"),
              _chip("Marca"),
              _chip("Color"),
              _chip("Motor"),
              _chip("Precio"),
            ],
          ),

          const SizedBox(height: 20),

          // lista 
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 0.72,
            children: autos.map((auto) {
              return _cardAuto(auto);
            }).toList(),
          ),
        ],
      ),
    );
  }

 //pantalla favoritos
  Widget _pantallaFavoritos() {
    final favoritos = autos.where((a) => a["fav"] == true).toList();

    if (favoritos.isEmpty) {
      return const Center(
        child: Text(
          "No hay autos favoritos ❤️",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 0.72,
      children: favoritos.map((auto) => _cardAuto(auto)).toList(),
    );
  }


// algo que se reutiliza
  Widget _chip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
      ),
    );
  }

// el adorno que tiene con corazones 
  Widget _cardAuto(Map<String, dynamic> auto) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Stack(
            children: [
              // Imagen
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  auto["img"],
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),

              // btn favorito
              Positioned(
                right: 8,
                top: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      auto["fav"] = !auto["fav"];
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      auto["fav"] ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  auto["titulo"],
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  auto["precio"],
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                Text(
                  auto["detalles"],
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

