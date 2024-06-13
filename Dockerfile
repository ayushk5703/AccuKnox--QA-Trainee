FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
cowsay \
fortune \
netcat-openbsd \
&& apt-get clean
ENV PATH="/usr/games:${PATH}"
RUN echo $PATH
RUN command -v cowsay
RUN command -v fortune
COPY wisecow.sh /usr/local/bin/server.sh
RUN chmod +x /usr/local/bin/server.sh
EXPOSE 4499
CMD ["/usr/local/bin/server.sh"]