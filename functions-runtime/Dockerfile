FROM microsoft/aspnetcore
ENV HOME /home
RUN apt-get update \ 
    && apt-get install -my wget gnupg \ 
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs

WORKDIR /app
COPY functions-runtime functions-runtime
COPY init_container.sh /bin/
ENV AzureWebJobsScriptRoot=/home/site/wwwroot

ENTRYPOINT ["/bin/init_container.sh"]
