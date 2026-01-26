# Usamos Ubuntu como base ya que es lo que tú manejas
FROM ubuntu:22.04

# Evita que la instalación pida confirmaciones manuales
ENV DEBIAN_FRONTEND=noninteractive

# Instalamos el servidor web Apache y las herramientas necesarias
RUN apt-get update && apt-get install -y apache2 wget zip unzip

# Descargamos la plantilla del café
ADD https://www.tooplate.com/zip-templates/2121_wave_cafe.zip /var/www/html/
WORKDIR /var/www/html/

# Descomprimimos y limpiamos
RUN unzip -o 2121_wave_cafe.zip && \
    cp -r 2121_wave_cafe/* . && \
    rm -rf 2121_wave_cafe 2121_wave_cafe.zip

# Comando para que Apache corra en primer plano
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
