FROM ubuntu:16.04
MAINTAINER Ahmed <root@outlook.com>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y zsh git software-properties-common wget unzip curl && \
    add-apt-repository ppa:neovim-ppa/stable && \
    apt-get update && \
    apt-get install -y neovim && \
    update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60 && \
    update-alternatives --config vi && \
    update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60 && \
    update-alternatives --config vim && \
    update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60 && \
    update-alternatives --config editor && \
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "/root/.zprezto" && \
    ln -s  /root/.zprezto/runcoms/zlogin /root/.zlogin && \
    ln -s  /root/.zprezto/runcoms/zlogout /root/.zlogout && \
    ln -s  /root/.zprezto/runcoms/zpreztorc /root/.zpreztorc && \
    ln -s  /root/.zprezto/runcoms/zprofile /root/.zprofile && \
    ln -s  /root/.zprezto/runcoms/zshenv /root/.zshenv && \
    ln -s  /root/.zprezto/runcoms/zshrc /root/.zshrc

COPY .zshrc /root/.zshrc
COPY .zpreztorc /root/.zpreztorc

CMD ["zsh"]
