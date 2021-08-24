# README

##Link a producción: 

https://nameless-crag-95048.herokuapp.com/

## Después del hacer el git clone a este repositorio:

1. Por consola ingresar a la carpeta respectiva del proyecto

2. Gestion de versiones con rvm

* En consola ejecutar el comando:

      rvm install

* Consultar versiones de Ruby instaladas

      rvm list
      
* Para usar una versión específica de Ruby, ejectuar el siguiente comando (usaremos como ejemplo la versión 2.7.3)

      rvm use ruby 2.7.3
      
* Administrar versiones a utilizar en el proyecto creando una gema, o utilizando una existente que sea compatible con las versiones que el proyecto exige. Para ello:

      rvm gemset create <nombre>
      
* Consultar lista de gemas RoR creadas:

      rvm gemset list
      
* Utilizar la gema que creamos en el proyecto con el siguiente comando:

      rvm gemset use <nombre>

* Esta app utiliza las siguientes versiones de Ruby on Rails:

  * Ruby version 2.7.3
  * Rails version 5.2.3
  
* El comando para instalar bundler: 

      gem install bundler
   
* Luego leemos los ficheros del gemfile con: 

      bundle
   
* Ahora podemos trabajar en nuestro proyecto acorde a los requerimientos de versiones que este exige. 

3. Para subir el proyecto a producción en Heroku: (si no estás logueado en heroku, debes hacerlo previamente)

* Crear proyecto en heroku
      
      heroku create

* Si no has hecho un commit a git, debes realizarlo antes de subir el proyecto (puedes consultar, añadir y hacer commit con los siguientes comandos en orden especificado)
    
      git status 
      
      git add . 
      
      git commit -m 'aqui la descripción para el commit'
      
* Subir proyecto a producción en Heroku (utilizaremos la rama master como ejemplo)

      git push heroku master 
    
* Posterior a ello, para migrar los requerimientos y lineamientos de nuestra base de datos, ejecutamos el siguiente comando: 

      rails run db:migrate
      
* Ahora podemos loguearnos en la página de heroku e ingresar a nuestro proyecto

* Si presentas algún inconveniente en el proceso para subir el proyecto a heroku puedes ejecutar el siguiente comando para identificar el posible error: 

      heroku logs
