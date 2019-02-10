# To execute a sh file from anywhere:
# go to: ".bashrc" inside your home directory and add:
# alias dock-del-c=/home/pablodonayre/Documentos/Execute/docker-delete.sh
# The concatenate operator “\” s used to concatenate lines

# Basic way
#sudo docker stop $(sudo docker ps -a -q) \
#  && sudo docker rm $(sudo docker ps -a -q) \
#  && sudo docker ps -a


# Advanced way
if [ "$(sudo docker ps -aq)" ]; then
        # stop and remove
        echo "stopping containers ..." \
        && sudo docker stop $(sudo docker ps -a -q) \
        && echo "removing containers ..." \
        && sudo docker rm $(sudo docker ps -a -q);
fi

# display running containers
echo "List of running containers";
sudo docker ps -a;
