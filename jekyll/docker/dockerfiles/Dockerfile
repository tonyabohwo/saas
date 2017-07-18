FROM registry.bionic.labs:5000/centos6:latest

RUN gem install jekyll --no-rdoc --no-ri
RUN gem install therubyracer --no-rdoc --no-ri
RUN gem install json --no-rdoc --no-ri

WORKDIR /data

ADD jekyll /data/jekyll

WORKDIR /data/jekyll

ENTRYPOINT ["jekyll", "serve", "--host=0.0.0.0"]
EXPOSE 4000



















