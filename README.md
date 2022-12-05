# Proyecto-ToleranteFallas
# https://www.canva.com/design/DAFT5-t6BlU/n7u9wOROVfpWCWmip9Jfzw/edit?utm_content=DAFT5-t6BlU&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton

# Se desplegará un bloque de una aplicación en Docker, Kubernetes, Apache Mesos, OpenShift, Rancher y Istio.
# El primer paso será descargar el proyecto
# Una vez teniendolo en alguna carpeta ejecutaremos el comando "npm install"
# Seguido de esto podremos ingresar el comando "npm run serve"

# Con esto será posible ver la siguiente aplicación:

![image](https://user-images.githubusercontent.com/62567797/205575562-7c1fde38-30b0-4c59-a76a-924c1cc4388b.png)

# Es importante mencionar que dentro de este proyecto para el registro de datos se uso Firebase de esta forma se pudo ir guardando datos en tiempo real.

![image](https://user-images.githubusercontent.com/62567797/205580479-8e2c5761-e9d5-45ce-9954-1e2319eb25c8.png)

# Lo siguiente será subir el proyecto a docker, primeramente creando la imagen con el comando "docker build -t <nombre>"
# Seguido de esto podremos comprobar las imagenes que tenemos creadas con el comando "docker images"

![Docker ps](https://user-images.githubusercontent.com/62567797/205580178-8fd1c6fd-8d17-41ba-8f7f-902c99300377.png)

# Subiremos la versión a docker con el comando: "npm run docker -release --tag <nombre sig. versión>"
# Se creo una cuenta en Microsoft Azure donde de igual forma se creo una maquina virtual con Ubuntu Docker que es donde subiremos el contenedor:

![image](https://user-images.githubusercontent.com/62567797/205580707-65c04861-26da-4851-b5ee-3b359da7ad87.png)

# Dentro del servidor tambien usaremos el comando "docker ps" para ver que contenedores estan corriendo
# Con el comando "docker pull <repositorio>/<carpeta>:<nombre imagen>" podremos extraer el último cambio generado, de una manera muy similar como funciona github y los
# cambios.

# Dentro del servidor crearemos el contenedor con el comando "docker run -d --rm -p 3030:3030 --name <nombre contenedor> <nombre repositorio/carpeta>:<tag(nombre 
# imagen)>

@
