wget -q --spider https://www.google.com

# -q,  --quiet    Silencioso (sin texto de salida).
#      --spider   Retorna la respuesta del servidor pero no descarga nada.

if [ $? -eq 0 ]; then
	# Si retorna respuesta el servidor entonces hay Internet.
	echo 
else
	# Si no retorna nada, entonces no hay Internet.
	echo 
	notify-send "  No Internet connection" "Verifica tu conección a Internet."
fi
