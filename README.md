# Linux_Docker_Container for valgrind and C & C++
Docker_Container for Visual Studio Code VSC* as {Linux / Ubuntu or Debian OS } for easy initialisation

######################################## for finding more informations to get a GitHub token: 
[https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-personal-access-token-classic)

######################################## set up the sh for GitHub

for github change in setup.sh the line 4: GITHUB_TOKEN="your actual GitHub token" with your personal GitHub token.

and in post_create.sh the line 11: ssh-keygen -t ed25519 -C "your_own@mail.com" -f $HOME/.ssh/id_ed25519 -N "" with your_own@mail.com (probably the one verified in GitHub?)

######################################## check running container id and then open the terminal in the docker

docker ps

########################################replace the ### with the actuala id

docker exec -it ############ /bin/bash

######################################## stopping all containers

docker stop $(docker ps -q)

######################################## Delating a Docker Container and cleaning the memory

docker-compose down --rmi all --volumes --remove-orphans

docker system prune -a --volumes -f
