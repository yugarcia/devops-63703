# Instalacion y configuracion de Prometheus y Grafana.

- Se armo un nuevo server debian con nombre de host Monitoring.
- Se crearon 2 tareas para la instalacion de grafana y Prometheus:
   * grafana.yml
   * prometheus-install.yml
- Estas 2 tareas antes mencionadas se incluyeron en el archivo main.yml con sus respectivos tags, y para correrlas se usaron las siguinetes lineas:
   * ansible-playbook -i inventory.ini --limit monitoring main.yml --tags install-grafana
   * ansible-playbook -i inventory.ini --limit monitoring main.yml --tags install-prometheus


# Instalar y configurar node exporter.
  
- Para esto se uso el mismo server donde se tenia instalado woerpress.
- Se creo una tarea para la instlacion de node-exporter:
  * node-exporter.yml
- Esta tarea tambien fue incluida en el main.yml con su tag correspondiente , y se ejecuto la siguiente linea:
  * ansible-playbook -i inventory.ini --limit wordpress main.yml --tags install-node-exporter

# Se realizaron las configuraciones adicionales para el funcionamiento del monitoreo
- configuracion de promtheus.yml
  agregar el siguiente contenido al archivo de configuracion prometheus.yml

job_name: 'node_exporter' scrape_interval: 5s static_configs: - targets: ['192.168.1.13:9100']

# Se  deja evidencia en la carpeta Imagenes de lo instalado.
 - Images.