FROM ruby
RUN apt-get -y update && apt-get -y install libicu-dev cmake && rm -rf /var/lib/apt/lists/*
RUN gem install github-linguist
RUN gem install gollum
RUN gem install org-ruby  # optional

RUN git clone https://github.com/ahmelsayed/omnigollum.git && \
    cd omnigollum && \
    gem build omnigollum.gemspec && \
    gem install omnigollum*.gem

RUN git clone https://github.com/ahmelsayed/omniauth-azure-activedirectory && \
    cd omniauth-azure-activedirectory && \
    gem build omniauth-azure-activedirectory.gemspec && \
    gem install omniauth-azure*.gem

COPY layout.mustache /usr/local/bundle/gems/gollum-4.1.2/lib/gollum/templates/layout.mustache
COPY gollum.css /usr/local/bundle/gems/gollum-4.1.2/lib/gollum/public/gollum/css/gollum.css
COPY user.mustache /usr/local/bundle/gems/gollum-4.1.2/lib/gollum/templates/user.mustache
COPY layout.rb /usr/local/bundle/gems/gollum-4.1.2/lib/gollum/views/layout.rb
COPY config.rb /etc/gollum/config.rb
COPY init.sh /bin/init.sh
RUN chmod +x /bin/init.sh

ENV AAD_TENANT=72f988bf-86f1-41af-91ab-2d7cd011db47
ENV AAD_CLIENT_ID=d1953119-8cea-4503-89cf-b14f620f0224

WORKDIR /home/site/wwwroot
ENTRYPOINT ["/bin/init.sh"]
EXPOSE 80
