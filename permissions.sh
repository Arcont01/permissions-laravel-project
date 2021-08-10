#!/bin/sh

echo "Escriba el nombre del directorio del proyecto:"
read directory

ROUTE="$directory"
USER=$(whoami)

echo $ROUTE

if [ -d "$ROUTE" ]; then
        $(sudo chown -R $USER:www-data $ROUTE)
        $(sudo find $ROUTE -type f -exec chmod 664 {} \;)
        $(sudo find $ROUTE -type d -exec chmod 775 {} \;)
        $(sudo chgrp -R www-data "${ROUTE}storage" "${ROUTE}bootstrap/cache")
        $(sudo chmod -R ug+rwx "${ROUTE}storage" "${ROUTE}bootstrap/cache")
        echo "Se terminaron de asignar permisos"
else
        echo "No existe el directorio a asignar permisos"
fi
