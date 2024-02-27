#!/bin/bash

# Nombre de usuario del sistema
user_name=$(logname)

# Nombre de la distribución
distro=$(cat /etc/*-release | grep PRETTY_NAME | cut -d '=' -f 2 | tr -d '"')

# Versión del kernel
kernel_version=$(uname -r)

# Nombre del host
host_name=$(hostname)

# Información del procesador
processor_info=$(cat /proc/cpuinfo | grep "model name" | uniq | cut -d ':' -f 2)

# Uso actual de la memoria
memory_usage=$(free -m | awk 'NR==2{printf "Uso de memoria (RAM): %s/%sMB (%.2f%%)\n", $3, $2, $3*100/$2 }')

# Espacio libre en el disco
disk_usage=$(df -h / | awk 'NR==2{printf "Espacio libre en el disco: %s/%s (%s)\n", $4, $2, $5}')

# Dirección IP
ip_address=$(hostname -I)

# Tiempo de actividad del sistema
uptime=$(uptime -p)

# Última fecha y hora de inicio de sesión
last_login=$(last -1 | head -n 1)

# Información del sistema de archivos
filesystem_info=$(df -Th)

# Configuración de red
network_info=$(ifconfig -a)

# Lista de usuarios
user_list=$(cat /etc/passwd | cut -d ":" -f 1)

# Información de los paquetes instalados
# package_info=$(dpkg -l)

# Información del hardware
# hardware_info=$(lshw)

# Información de la CPU
cpu_info=$(lscpu)

# Información de la memoria física
physical_memory_info=$(cat /proc/meminfo | grep "MemTotal")

# Información de los discos duros
# disk_info=$(fdisk -l)

# Información de la tarjeta gráfica
gpu_info=$(lspci | grep -i vga)

# Guardar la información en un archivo
output_file="system_info.txt"

echo "Información del sistema Linux" > "$output_file"
echo "=================================" >> "$output_file"
echo "Nombre de usuario del sistema: $user_name" >> "$output_file"
echo "Distribución: $distro" >> "$output_file"
echo "Versión del kernel: $kernel_version" >> "$output_file"
echo "Nombre del host: $host_name" >> "$output_file"
echo "Información del procesador: $processor_info" >> "$output_file"
echo "$memory_usage" >> "$output_file"
echo "$disk_usage" >> "$output_file"
echo "Dirección IP: $ip_address" >> "$output_file"
echo "Tiempo de actividad del sistema: $uptime" >> "$output_file"
echo "Última fecha y hora de inicio de sesión: $last_login" >> "$output_file"
echo "" >> "$output_file"
echo "Información del sistema de archivos:" >> "$output_file"
echo "$filesystem_info" >> "$output_file"
echo "" >> "$output_file"
echo "Configuración de red:" >> "$output_file"
echo "$network_info" >> "$output_file"
echo "" >> "$output_file"
echo "Lista de usuarios:" >> "$output_file"
echo "$user_list" >> "$output_file"
echo "" >> "$output_file"
# echo "Información de los paquetes instalados:" >> "$output_file"
# echo "$package_info" >> "$output_file"
echo "" >> "$output_file"
echo "Información del hardware:" >> "$output_file"
# echo "$hardware_info" >> "$output_file"
echo "" >> "$output_file"
echo "Información de la CPU:" >> "$output_file"
echo "$cpu_info" >> "$output_file"
echo "" >> "$output_file"
echo "Información de la memoria física:" >> "$output_file"
echo "$physical_memory_info" >> "$output_file"
echo "" >> "$output_file"
#echo "Información de los discos duros:" >> "$output_file"
#echo "$disk_info" >> "$output_file"
echo "" >> "$output_file"
echo "Información de la tarjeta gráfica:" >> "$output_file"
echo "$gpu_info" >> "$output_file"

echo "Información del sistema guardada en $output_file"
