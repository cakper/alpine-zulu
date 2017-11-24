# keeping the base image version explicit, because it dictates the install location of the jdk
FROM azul/zulu-openjdk-alpine:8u144

# install basic stuff
RUN apt-get update && \
    apt-get install -y less curl vim

# install Zulu Cryptography Extension Kit
# https://www.azul.com/products/zulu-and-zulu-enterprise/zulu-cryptography-extension-kit/
COPY ZuluJCEPolicies/*.jar /usr/lib/jvm/zulu-8-amd64/jre/lib/security/

RUN mkdir -p /opt && cd /opt && \
    curl http://www.us.apache.org/dist/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz | tar -zx && \
    ln -s spark-spark-2.2.0-bin-hadoop2.7 spark
