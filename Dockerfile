FROM debian:buster-slim

COPY ./server.properties /
COPY ./start.sh /
COPY ./eula.txt /

RUN apt-get update \
  && mkdir -p /usr/share/man/man1 \
  && apt-get install -y default-jdk wget jq curl

RUN cd / \
  && wget https://launchermeta.mojang.com/mc/game/version_manifest.json \
  && export latest_version=$(cat /version_manifest.json | jq ".latest.release" | sed "s/\"//g") \
  && export version_url=$(cat version_manifest.json | jq --arg version "$latest_version" '.versions[] | select( .id == $version) | .url' | sed "s/\"//g") \
  && export download_url=$(curl "$version_url" | jq '.downloads.server.url' | sed "s/\"//g") \
  && wget $download_url

EXPOSE 25565

RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
CMD ["2","2"]
