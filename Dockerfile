FROM maven:3.6-jdk-8-slim
RUN apt-get -y update
RUN apt-get -y install git
#RUN ssh-keyscan -H github.com >> ~/.ssh/known_hosts
RUN mvn -version
#RUN git clone git@github.com:vishalbagi/Cucumber-API.git
RUN git clone https://github.com/vishalbagi/Cucumber-API.git
CMD ls
CMD ls
RUN cd Cucumber-API && mvn clean verify -Dcucumber.options="--tags @SBDB"
