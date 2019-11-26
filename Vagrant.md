# Vagrant

Este archivo contiene las instrucciones necesarias para realizar el despliegue de un LAMP, incluye adminer, en vagrant con las siguientes especificaciones:
  · box: ubuntu/eoan64
  · RAM: 2048MB
  · Redireccionamiento puerto 8080:localhost:80

### Provisionamiento

git clone https://github.com/mozo95/P17.git

### Installation

```sh
$ cd projecto03
$ vagrant up
$ vagrant provision
$ vagrant ssh
```

### Comprobacion

Para comprobar el apache2

```sh
$ sudo service apache2 status
```

Para comprobar el mysql

```sh
$ sudo service mysql status
```

Para comprobar el adminer

```sh
$ curl http://localhost/adminer.php
```
