#! /bin/bash
ls -l  /home/irving/.local/share/Trash/files/

echo -e "\nIngresa el nombre del archivo o directorio a recuperar"

read archivo

mv /home/irving/.local/share/Trash/files/$archivo /home/irving/Restaurar

echo -e "\nse ha recuperado el archivo"
