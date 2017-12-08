#! /bin/bash

while :
do 

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

echo "Configurar las interfaces de Red"

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "1.- Alámbrica "
echo ""
echo "2.- Inalámbrica"
echo ""
echo "3.- Salir"
echo ""
echo "Elige la opción: "
read opcion

case $opcion in


1) echo "Haz elegido la interfaz alambrica:";

echo "Elige la asignación de IP: "
echo "1.- Estática"
echo "**************************"
echo "2.- Dinámica"
echo "*************************"
echo "Ingresa la opción: " 
read opcion

case $opcion in

1) echo "Haz elegido la opcion Estática: "

echo -e "\n Estas son tus interfaces de red\n"
sudo ifconfig
sleep 7

echo -e "\n ¿Que interfaz quieres? "
read interfaz
echo -e "\nIngrese la dirección IP"
read ip
echo -e "\nIngrese la mascara de subred"
read mascara

sudo ifconfig $interfaz $ip netmask $mascara up
echo -e "\n Configuración exitosa"

echo -e "\nIngresa la ip del gateway prederterminado: "
read gw
route add default gw $gw

;;

2) echo "Haz elejido la opción Dinámica: "

echo -e "\nEstas son tus interfaces de red\n"
sudo ifconfig
sleep 7

echo -e "\n¿Que interfaz quieres?"
read interfaz

sudo dhclient $interfaz

;;

esac
;;

2) echo "Haz elegido la interfaz Inalambrica: "
echo "Elige la asignación de IP:"
echo "************************"
echo "1.- Estática"
echo "************************"
echo "2.- Dinámica"
echo "*************************"
echo "Ingresa la opción: " 
read opcion

case $opcion in

1) echo "Configuracion Estática: "
echo -e "\nEstas son tus interfaces de red \n"
sudo ifconfig
sleep 7

echo -e "\n¿Qué interfaz configuraras?"
read interfaz
echo -e "\n*estas son las redes disponibles*"
nmcli dev wifi list
echo -e "\nIngresa el Nombre de la red a la que deseas acceder: "
echo -e "\n Ejemplo: Infinitum8c1-2-4"
read essid
echo -e "\n ingresa la contraseña: "
read pass

sudo iwconfig $interfaz essid $essid key s:$pass

echo -e "\nIngresa la dirección IP a usar "
read ip
echo -e "\nIngrea la mascara de subred a usar"
read mascara

sudo ifconfig $interfaz $ip netmask $mascara up
echo -e "\nTu interfaz ha sido configurada exitosamente"
echo -e "\nIngresa la ip del gateway predeterminado: "
read gw
route add default gw $gw

;;

2) echo -e "\nConfiguracion Dinámica: "
echo -e "\nEstas son tus interfaces de red\n"
sudo ifconfig
sleep 7

echo -e "\n¿Qué interfaz quieres?"
read interfaz
echo -e "\n*Estas son las redes disponibles*"
nmcli dev wifi list
echo -e "\nIngresa el nombre de la red a la que deseas acceder: "
echo -e "\n Ejemplo: InfinitumHJC38"
read essid
echo -e "\nIngresa la contraseña: "
read pass

sudo iwconfig $interfaz essid $essid key s:$pass

sudo dhclient $interfaz

;;

esac
;;

3) echo "Adiós" 
whoami;
exit 1;;

esac
done

