## Moodle - Docker Compose

[Moodle](https://moodle.org) es un sistema gratuito para gestión del aprendizaje en línea (learning management system =LMS) también conocido como Entorno Virtual de Aprendizaje (Virtual Learning Environment = VLE).

Este repositorio contiene una solución para el **despliegue automatizado** de instancias Moodle en **modo desarrollo** basadas en **Docker** y Docker Compose.

La instancia Moodle desplegada tiene una arquitectura en Clúster con los siguientes nodos:
- Nodo *moodle-web*: nodo que ejecuta servidor web
- Nodo *moodle-cron*: nodo que ejecuta script de cron
- Nodo *moodle-php*: nodo que ejecuta php-fpm
- Nodo *moodle-cache*: nodo que ejecuta redis como caché
- Nodo *moodle-db*: base de datos de Moodle

Este proyecto ha sido probado con éxito para desplegar instancias 
- Moodle 3.8
- Moodle 3.9
- Moodle 3.10
- Moodle 3.11
- Moodle 4.0
- Moodle 4.1

## Instalación

Clona el repositorio
```
git clone https://github.com/edssn/moodle-docker.git
```

Ingresa en el directorio
```
cd moodle-docker
```

Construir imagenes
```
docker build -t edissonsigua/almalinux8-php74 common    # common image
docker build -t edissonsigua/moodle-cron cron           # moodle cron
docker build -t edissonsigua/moodle-web nginx           # moodle web
docker build -t edissonsigua/moodle-php php-fpm         # moodle php
```

Configura el archivo con las variables globales
```
mv .env.example .env
```

Ejecuta los contenedores
```
docker compose up -d
```

Ingresa a un navegador web
```
http://locahost
```

