echo "copy blockchain to .bitcoin directory.  wait 1-2 hours"
sudo rsync -rv linaro@192.168.1.146:/home/linaro/livebak/ /home/linaro
sudo chown -R linaro:linaro /home/linaro
echo "blockchain database copy complete" >> /home/linaro/setup.log
