
#!/bin/bash
# Actualizar repositorios y se instalan los paquetes necesarios
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y apache2

# Reiniciar apache
sudo systemctl restart apache2

# Limpiar directorio web por defecto
sudo rm -rf /var/www/html/*

# Clonar repositorio
cd /var/www/html
sudo git clone https://github.com/Inereaa/TFparte4.git
sudo mv TFparte4/index.php /var/www/html/
sudo mv TFparte4/NoticiasText.php /var/www/html/

sudo rm -rf TFparte4/

# Ajustar permisos
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

# Reiniciar Apache para aplicar todos los cambios
sudo systemctl reload apache2

# Se habilita y arranca el apache
sudo systemctl enable apache2
sudo systemctl start apache2
