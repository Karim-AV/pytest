USER root
RUN apt-get update && apt-get install -y python3 python3-pip
ENTRYPOINT ["top", "-b"]
USER jenkins