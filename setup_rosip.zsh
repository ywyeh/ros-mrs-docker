#!/bin/zsh
if [ "$ROS_IP" = "" ]
then
    echo "export ROS_IP=$(hostname -I | awk '{print $1}')" >> ~/.zshrc
    echo "export ROS_MASTER_URI=http://$(hostname -I | awk '{print $1}'):11311" >> ~/.zshrc
    source ~/.zshrc
fi