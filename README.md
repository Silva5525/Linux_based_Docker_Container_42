# Linux_Docker_Container for valgrind and C & C++
Docker_Container for Visual Studio Code VSC* as {Linux / Ubuntu or Debian OS } for easy initialisation

for github change in Dockkerfile the line: 

######################################## check running container id and then open the terminal in the docker

docker ps

replace the ### with the actuala id

docker exec -it ############ /bin/bash

######################################## stopping all containers

docker stop $(docker ps -q)

######################################## Delating a Docker Container and cleaning the memory

docker-compose down --rmi all --volumes --remove-orphans

docker system prune -a --volumes -f
