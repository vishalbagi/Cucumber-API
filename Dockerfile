FROM maven:3.6-jdk-8-slim
RUN apt-get -y update
RUN apt-get -y install git
#RUN ssh-keyscan -H github.com >> ~/.ssh/known_hosts
RUN mvn -version
ARG MVND_DOWNLOAD_URL=https://github.com/vishalbagi/Cucumber-API/archive/refs/tags/latest.zip
RUN curl -fsSL -o test.zip ${MVND_DOWNLOAD_URL} ; 
#RUN git clone https://github.com/vishalbagi/Cucumber-API
RUN mkdir -p /tmp/zip && unzip mvnd.zip -d /tmp/zip \
    && mv /tmp/zip/`ls /tmp/zip | head -n 1` /tmp/test
COPY --from=0 /tmp/mvnd /usr/local/mvnd    
CMD ls
CMD ls
RUN cd Cucumber-API && mvn clean verify -Dcucumber.options="--tags @SBDB"
