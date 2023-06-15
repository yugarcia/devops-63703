# Guía de Primeros Pasos con Vagrant

## Paso 1: Instalación de Vagrant:

Ve al sitio web oficial de Vagrant en https://www.vagrantup.com/ y descarga la última versión de Vagrant según el sistema operativo que estén utilizando.
Sigue las instrucciones de instalación proporcionadas por el sitio web de Vagrant para tu sistema operativo específico.
Verifica que Vagrant se haya instalado correctamente abriendo una ventana de terminal (o línea de comandos) y ejecutando el comando vagrant --version. Debería mostrarte la versión de Vagrant instalada.

## Paso 2: Creación de un directorio de trabajo:

Crea un nuevo directorio en el lugar donde desees trabajar en tus proyectos de Vagrant.
Abre una ventana de terminal y navega hasta el directorio recién creado utilizando el comando cd.

## Paso 3: Inicialización del proyecto:

En la ventana de terminal, ejecuta el comando vagrant init. Esto creará un archivo de configuración llamado "Vagrantfile" en el directorio actual.
El archivo Vagrantfile contiene la configuración de tu entorno de desarrollo. Puedes abrirlo con un editor de texto para personalizarlo según tus necesidades, pero por ahora, puedes dejarlo como está.

## Paso 4: Elección de una imagen base (box):

Vagrant utiliza imágenes base llamadas "boxes" para crear máquinas virtuales. Puedes elegir una box predefinida o buscar una en la Vagrant Cloud (https://app.vagrantup.com/boxes/search) según tus necesidades.
En el archivo Vagrantfile, encuentra la línea que comienza con config.vm.box =. Reemplázala con el nombre de la box que deseas utilizar. Por ejemplo, config.vm.box = "ubuntu/kinetic64".

## Paso 5: Inicio de la máquina virtual:

En la ventana de terminal, ejecuta el comando vagrant up. Esto iniciará la máquina virtual utilizando la configuración del archivo Vagrantfile y la box seleccionada.
Vagrant descargará la box si es necesario y creará la máquina virtual. El proceso puede llevar unos minutos dependiendo de la velocidad de tu conexión a Internet.

## Paso 6: Acceso a la máquina virtual:

Una vez que la máquina virtual esté en funcionamiento, puedes acceder a ella utilizando el comando vagrant ssh. Esto abrirá una conexión SSH a la máquina virtual.
Ahora estás dentro de la máquina virtual y puedes ejecutar comandos como lo harías en una terminal normal.

## Paso 7: Detener y destruir la máquina virtual:

Cuando hayas terminado de usar la máquina virtual, puedes detenerla ejecutando el comando vagrant halt en la ventana de terminal.
Si deseas eliminar completamente la máquina virtual, puedes ejecutar el comando vagrant destroy. Esto eliminará todos los archivos asociados con la máquina virtual, pero ten cuidado, ya que no se puede deshacer.

## Links de interes.

[Repositorio de Vagrant Boxes](https://app.vagrantup.com/boxes/search)

[Intalar Vagrant](https://developer.hashicorp.com/vagrant/downloads)

[Documentacion Vagrant](https://developer.hashicorp.com/vagrant/docs)