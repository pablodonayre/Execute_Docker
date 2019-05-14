# To execute a sh file from anywhere:
# go to: ".bashrc" inside your home directory and add:
# alias dock-del-all=/home/pablodonayre/Documentos/Execute/docker-delete-all.sh


# Basic way
#sudo docker stop $(sudo docker ps -a -q) \
#  && sudo docker rm $(sudo docker ps -a -q) \
#  && sudo docker rmi -f $(sudo docker images -q) \
#  && sudo docker images \
#  && sudo docker ps -a


# Advanced way
if [ "$(sudo docker ps -a -q)" ]; then
    # stop and remove
    echo "stopping containers ..." \
    && sudo docker stop $(sudo docker ps -a -q) \
    && echo "removing containers ..." \
    && sudo docker rm $(sudo docker ps -a -q);
fi

if [ "$(sudo docker volume ls -f dangling=true -q)" ]; then
    echo "removing dangling volumes ..." \
    && sudo docker volume rm $(sudo docker volume ls -f dangling=true -q);
fi

if [ !"$(sudo docker ps -a -q)" ]; then
    if [ "$(sudo docker images -q)" ]; then
        echo "removing images ..." \
        && sudo docker rmi -f $(sudo docker images -q);
    fi
fi

sudo docker network prune;

# display list of networks
echo "List of Networks";
sudo docker network ls;

# display list of volumes
echo "List of volumes";
sudo docker volume ls;

# display list of images
echo "List of images";
sudo docker images;

# display running containers
echo "List of running containers";
sudo docker ps -a;
