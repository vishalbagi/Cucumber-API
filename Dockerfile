FROM maven:3.6-jdk-8-slim
RUN mvn -version
RUN git clone https://github.com/vishalbagi/Cucumber-API.git
CMD ls
CMD ls
RUN cd Cucumber-API && mvn test