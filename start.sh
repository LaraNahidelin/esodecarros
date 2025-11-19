#!/bin/bash
# ---------------------------------------
# start.sh - Deploy Flutter Web en Railway
# ---------------------------------------

# 1️⃣ Configuración de Flutter web
flutter config --enable-web

# 2️⃣ Obtener dependencias
echo "Obteniendo dependencias..."
flutter pub get

# 3️⃣ Build de Flutter web
echo "Construyendo Flutter Web..."
flutter build web --release

# 4️⃣ Instalar static-server si no está disponible
if ! command -v static-server &> /dev/null
then
    echo "Instalando static-server..."
    npm install -g static-server
fi

# 5️⃣ Servir la carpeta build/web en el puerto asignado por Railway
echo "Sirviendo Flutter Web en puerto $PORT..."
static-server ./build/web --port $PORT
