FROM maven:3.6-jdk-8-slim
RUN apt-get -y update
RUN apt-get -y install unzip
#RUN ssh-keyscan -H github.com >> ~/.ssh/known_hosts
RUN mvn -version

RUN curl https://github.com/vishalbagi/Cucumber-API/archive/refs/tags/latest.zip -L -o test.zip

RUN mkdir -p /tmp/zip && unzip test.zip -d /tmp/zip \
    && mv /tmp/zip/`ls /tmp/zip | head -n 1` /tmp/test
    
#RUN git clone https://github.com/vishalbagi/Cucumber-API
CMD ls
RUN cd test
CMD ls
RUN cd Cucumber-API && mvn clean verify -Dcucumber.options="--tags @SBDB"
