# README

* Ruby 3.0.2 & Rails 7.0.0Alpha2
https://rubyapi.org/
https://github.com/rails/rails
https://guides.rubyonrails.org/

* HotWire/Stimulus/Turbo -> Front End Framework
https://hotwired.dev/

* TailwindCSS -> CSS Library
https://tailwindcss.com/

* Docker -> Containerize application & dependencies 
https://www.docker.com/

TODO -> RUNNING THE APPLICATION

This application comes with a docker file which will build the app into a docker image which 
will pull all of the application dependencies, these will not be natively installed on your system
Once the image is built it can be run within a container on your host system

More information on Docker can be found at

To build the image enter the following from the root directory of the application: 
```docker build .```

To see if the image is available run:
docker list images 

To start the container run: 
docker compose etc etc

This will start the container, run the rails application and connect it to a PostGresSQL 
database. Containers are temporary objects, once the container is killed all data within the application
will be lost unless persistent volumes are configured. 
