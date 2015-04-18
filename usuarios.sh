#!/bin/bash
COUNTER=0
USUARIO="usuario"
if [[ $EUID -ne 0 ]]; then
	echo "Este script solo puede ser ejecutado por root" 1>&2
	exit 1
fi
while [ $COUNTER -lt 10 ]; do
	LINEA=$USUARIO$COUNTER
	useradd -m -s /bin/bash $LINEA
	let COUNTER=COUNTER+1
done

echo "Operacion realizada con exito"
