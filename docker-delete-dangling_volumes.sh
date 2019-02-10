# To execute a sh file from anywhere:
# go to: ".bashrc" inside your home directory and add:
# alias dock-del-img=/home/pablodonayre/Documentos/Execute/docker-delete-images.sh

# Basic way
#sudo docker rmi -f $(sudo docker images -q) \
#  && sudo docker images \
#  && sudo docker ps -a


# Advanced way
if [ "$(sudo docker volume ls -f dangling=true -q)" ]; then
        # remove
        sudo docker volume rm $(sudo docker volume ls -f dangling=true -q)

fi

# display list of volumes
echo "List of Volumes";
sudo docker volume ls;
