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

Descarga el código de la versión de Moodle que deseas desplegar desde la [Página Oficial de Moodle](https://download.moodle.org)
```
wget https://download.moodle.org/download.php/direct/stable401/moodle-latest-401.tgz
tar xf moodle-latest-401.tgz
```

Configurar permisos de los directorios
```
chmod -R 777 moodle moodledata
```

Construir imagenes
```
docker-compose build
```

Configura el archivo con las variables globales
```
mv .env.example .env
```

Ejecuta los contenedores
```
docker-compose up -d
```

Ingresa a un navegador web
```
http://locahost
```


## Otras Versiones de Moodle
Si deseas desplegar otras versiones de Moodle, debes modificar el archivo `./common/Dockerfile` de la imagen base para instalar la versión de php compatible con la versión de Moodle que deseas. 

Luego de modificar el archivo Dockerfile, construye una nueva imagen base y cambia los archivos `./cron/Dockerfile` y `./php-fpm/Dockerfile` para hacer referencia a la nueva imagen base

Para conocer la compatibilidad de versiones de PHP con Moodle visita el [Sitio de Desarrolladores de Moodle](https://moodledev.io/general/releases) 