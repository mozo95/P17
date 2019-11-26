# Vagrant

### Provisionamiento

git clone https://github.com/mozo95/projecto03.git

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
