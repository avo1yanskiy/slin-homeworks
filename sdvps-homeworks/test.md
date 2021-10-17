version: '3'
services:
  volyanskiyas-netology-db:
    image: postgres:latest # Образ, который мы будем использовать
    container_name: volyanskiyas-netology-db # Имя, которым будет называться наш контейнер
    ports: # Порты, которые мы пробрасываем с нашего докер сервера внутрь контейнера
      - 5432:5432
    volumes: # Папка, которую мы пробросим с докер сервера внутрь контейнера
      - /pg_data:/var/lib/postgresql/data/pgdata
    environment: # Переменные среды
      POSTGRES_PASSWORD: volyanskiyas12!3!! # Задаём пароль от пользователя postgres
      POSTGRES_DB: volyanskiyas-netology_db # БД которая сразу же будет создана
      PGDATA: /var/lib/postgresql/data/pgdata # Путь внутри контейнера, где будет папка pgdata
    networks:
      volyanskiyas-my-netology-hw:
        ipv4_address: 172.22.0.2
    restart: always # Режим перезапуска контейнера. Контейнер всегда будет перезапускаться
  pgadmin:
    image: dpage/pgadmin4
    container_name: volyanskiyas-netology-pgadmin    
    environment:
      PGADMIN_DEFAULT_EMAIL: avolyanskiy@gmail.com     
      PGADMIN_DEFAULT_PASSWORD: 123    
    ports:      
     - "61231:80"    
    networks:      
      volyanskiyas-my-netology-hw:        
        ipv4_address: 172.22.0.3    
    restart: always
  zabbix-server:
    image: zabbix/zabbix-server-pgsql
    container_name: volyanskiyas-netology-zabbix
    links: 
      - avolyanskiy-netology-db 
    environment:     
      DB_SERVER_HOST: '172.22.0.2' 
      POSTGRES_USER: postgres  
      POSTGRES_PASSWORD: volyanskiyas12!3!! 
    ports:
      - "10051:10051" 
    networks:   
      volyanskiyas-my-netology-hw:  
        ipv4_address: 172.22.0.4  
    restart: always
  zabbix_wgui:
    image: zabbix/zabbix-web-apache-pgsql
    links:      
      - volyanskiyas-netology-db     
      - volyanskiyas-netology-zabbix    
    container_name: volyanskiy-netology-zabbix-wgui  
    environment:    
      DB_SERVER_HOST: '172.22.0.2'  
      POSTGRES_USER: 'postgres'  
      POSTGRES_PASSWORD: volyanskiyas12!3!!   
      ZBX_SERVER_HOST: "zabbix_wgui" 
      PHP_TZ: "Europe/Moscow"  
    ports:     
      - "80:8080" 
      - "443:8443"   
    networks:    
      volyanskiyas-my-netology-hw:
        ipv4_address: 172.22.0.5 
    restart: always

  networks:
    volyanskiyas-my-netology-hw:
      driver: bridge
      ipam:
        config:
        - subnet: 172.22.0.0/24