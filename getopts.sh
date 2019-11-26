#!/bin/bash
#usuari hostname i port(si no especifica es 3306 sino entre 1024 65535),
#opcionalment t comprova connexió
#define sintaxis del scrip
usage() { echo "Usage: $0 [-u <string>] [-h <string>] [-p <1024|65535 p.def.3306>] [-t <optional/check connection>]" 1>&2; exit 1; }

#asigna els parametres dels script a variables
while getopts ":u:h:p:t" o; do
	case "${o}" in
		u)
			usu=${OPTARG}
			;;
		h)
			host=${OPTARG}
			;;
		p)
			port=${OPTARG}
			;;
		t)
			try=1
			;;
		*)
			usage
			;;
	esac
done
#comprova si sha definit port, si no sha definit assigna per defecte el 3306
if [[ -z ${port} ]]
then
	port=3306
fi
#comprova si  l'usuari vol realitzar la prova de connexiò amb -t
if [[ -z ${try} ]];
then
	null=null
else
	echo "Es realitzarà prova de connexió"
	ping -c 4 ${host}
	exit 1
fi
#comprova que sha definit lusuari
if [[ -z ${usu} ]];
then
	echo "Usuari no definit"
	usage
	exit 1
else
#comprova si sha definit host
	if [[ -z ${host} ]];
	then
		echo "L'usuari es ${usu} pero el host no esta definit"
		usage
		exit 1
	else
#comprova que el port es troba entre 1024 i 65535
		if [[ $port -lt 1025 ]];
		then
			echo "Port reservat, exiting"
			usage
			exit 1
		elif [[ $port -gt 65535 ]]
		then
			echo "No existen puertos superiores a 65535, exiting"
			usage
			exit 1
#determina si sutilitza el port prederminat
		elif [[ ${port} -eq 3306 ]]
		then
			echo "L'usuari es ${usu}, el host es ${host} i el port per defecte es ${port}"
		else
			echo "L'usuari es ${usu} el host es ${host} i s'ha definit el port ${port}"

		fi
	fi
fi
