FROM osrf/ros:noetic-desktop-full

RUN apt update && apt install -y \
    vim \
    git \
    net-tools \
    ranger \
    tmux

# for obstacle detector package
RUN apt install -y \
    liblapack-dev \
    libblas-dev \
    libboost-dev \
    libarmadillo-dev

RUN apt-get install -y zsh wget
RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
RUN chsh -s /bin/zsh

RUN apt install -y \
    ros-noetic-robot-localization \
    ros-noetic-map-server
    
RUN echo "source /opt/ros/noetic/setup.zsh" >> ~/.zshrc
RUN echo "source /root/euro_ws/devel/setup.zsh" >> ~/.zshrc
RUN echo "PS1=\"\[\033[1;32;1m\][\[\033[1;34;40m\]\u@\h:\[\033[0;36;40m\]\w\[\033[1;32;1m\]]\[\033[1;31;1m\]\$\[\033[1;36;1m\]\"" >> ~/.bashrc

CMD ["/bin/zsh"]