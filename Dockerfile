FROM maven:3.6-jdk-8-slim
RUN mvn -version
RUN git clone git@github.com:vishalbagi/Cucumber-API.git
CMD ls
CMD ls
RUN cd Cucumber-API && mvn clean verify -Dcucumber.options="--tags @SBDB"
