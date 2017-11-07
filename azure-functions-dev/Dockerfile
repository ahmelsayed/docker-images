FROM ahmelsayed/zsh

# Install .NET Core 2.0
RUN apt-get install -y apt-transport-https && \
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg && \
    sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list' && \
    apt-get update && \
    apt-get install -y dotnet-sdk-2.0.0

# Install node 8.x
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install -y build-essential


RUN wget https://functionscdn.azureedge.net/public/2.0.1-beta.20/Azure.Functions.Cli.zip && \
    mkdir -p /root/.azurefunctions/cli && \
    unzip Azure.Functions.Cli.zip -d /root/.azurefunctions/cli && \
    rm Azure.Functions.Cli.zip

RUN wget https://download.docker.com/linux/static/stable/x86_64/docker-17.09.0-ce.tgz && \
    tar xzvf docker-17.09.0-ce.tgz && \
    mv docker /root/.docker-17-bin && \
    ln -s /root/.docker-17-bin/docker /usr/bin/docker

RUN echo 'alias func="dotnet /root/.azurefunctions/cli/Azure.Functions.Cli.dll"' >> /root/.zshrc

EXPOSE 7071

CMD ["zsh"]
