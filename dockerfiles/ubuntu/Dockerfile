FROM ubuntu:22.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y sudo make
RUN apt-get install -y zsh vim tmux curl direnv git

ARG USERNAME=user
ARG GROUPNAME=user
ARG UID=1000
ARG GID=1000
ARG PASSWORD=user
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USERNAME

COPY ./ /home/$USERNAME/.dotfiles

WORKDIR /home/$USERNAME/.dotfiles

# RUN make setup OS=ubuntu || true
RUN make mygit || true

WORKDIR /home/$USERNAME

CMD /usr/bin/zsh
# CMD /bin/bash

