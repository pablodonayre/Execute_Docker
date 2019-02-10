# To execute a sh file from anywhere:
# go to: ".bashrc" inside your home directory and add:
# alias dock-del-img=/home/pablodonayre/Documentos/Execute/docker-delete-images.sh

# Basic way
#sudo docker rmi -f $(sudo docker images -q) \
#  && sudo docker images \
#  && sudo docker ps -a


# Advanced way
if [ "$(sudo docker images -q)" ]; then
        # force to remove
        sudo docker rmi -f $(sudo docker images -q)

fi

# display list of images
echo "List of images";
sudo docker images;
