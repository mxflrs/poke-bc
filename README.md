# Pokedex

Una aplicación Flutter que consume la [PokeAPI](https://pokeapi.co/) para mostrar información sobre los Pokémon.

## 📋 Requisitos previos

Asegúrate de tener instalado lo siguiente:

- [Flutter](https://docs.flutter.dev/get-started/install) (Última versión estable)
- Dart SDK (incluido con Flutter)
- Dispositivo físico o emulador configurado

## 🚀 Instalación

1. Clonar el repositorio:

```bash
   git clone https://github.com/tu-usuario/pokedex.git
   cd pokedex
```

2. Verificar que Flutter está correctamente configurado:

```bash
   flutter doctor
```

3. Instalar las dependencias:

```bash
   flutter pub get
```

## ▶️ Ejecución de la aplicación

Para ejecutar la app en modo debug:

```bash
   flutter run
```

Si deseas ejecutarla en un dispositivo específico, lista los dispositivos disponibles con:

```bash
   flutter devices
```

Y luego selecciona uno con:

```bash
   flutter run -d <ID_DEL_DISPOSITIVO>
```

## 🔍 Endpoints utilizados

- Obtener la lista de Pokémon:

```
https://pokeapi.co/api/v2/pokemon?limit=100
```

- Obtener detalles de un Pokémon:

```
https://pokeapi.co/api/v2/pokemon/{id}/
```

## 📊 Comandos útiles

- Ejecutar pruebas:

```bash
   flutter test
```

- Generar una build para Android:

```bash
   flutter build apk
```

- Generar una build para iOS:

```bash
   flutter build ios
```
