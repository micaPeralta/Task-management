# Task Management

Este proyecto consiste en  un servicio on-line de autogestión de listas de tareas.El uso de la aplicación es sin autenticación, 	permitiendo a cualquier persona crear listas y gestionar tareas, sin necesidad de registrarse.

Demo -> https://tasks-management.herokuapp.com

## Requerimientos 
  + Ruby 2.3.1
  + Bundle 1.13.6
  
  
## Instalación 

 1. Clone el repositorio
 ```	
 git clone https://github.com/micaPeralta/Task-management.git
 ```  
 
 2. Ubíquese  en la carpeta del proyecto e instale las dependencias
 
 ```
 cd Task-management
 bundle install 

 ```
3. Corra las migraciones de la base de datos , junto con los seeders provistos.
 ```
 bundle exec rails db:setup

 ```

## Ejecución
1. Corra el servidor

	```
	bundle exec rails s

	```
2. Coloque en el navegador la siguiente direccion:  [http://localhost:3000](http://localhost:3000)

## Correr tests

 ```
 bundle exec rspec 

 ```

