#!/bin/bash
echo ingrese la ruta del directorio o archivo a borrar
read ruta
mv $ruta /home/irving/.local/share/Trash/files
echo se ha borrado con éxito

