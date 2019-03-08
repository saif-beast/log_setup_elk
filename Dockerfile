FROM ubuntu

RUN apt-get update

######### Install JAVA 8 Runtime #########
RUN apt-get install openjdk-8-jre -y

##########################################
######## Installing ElasticSearch ########
##########################################

####  Signing Key to verify downloaded package ####
RUN apt-get install gnupg2 -y
RUN apt-get install wget -y
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

#### Require this package for debian ####
RUN apt-get install apt-transport-https -y

#### Add repository definition and update ####
RUN echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list
RUN apt-get update

#### Install elasticsearch ####
RUN apt-get install elasticsearch -y
COPY elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

##########################################
########     Installing Kibana    ########
##########################################
RUN apt-get install kibana -y
COPY kibana.yml /etc/kibana/kibana.yml

##########################################
########    Installing Logstash   ########
##########################################
RUN apt-get install logstash -y
#COPY kibana.yml /etc/kibana/kibana.yml

##### ENTRYPOINT #####
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
