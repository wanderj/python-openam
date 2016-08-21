#!/usr/bin/env bash


TAG=$1

# Start docker OpenAM ${TAG}
docker run -d -h openam.example.com --name openam -p 8080:8080 openam:${TAG}

until curl -Is http://openam.example.com:8080/openam/isAlive.jsp | head -n 1 | grep "200 OK" >/dev/null; do
    sleep 5
done

echo "OpenAM with tag ${TAG} is started and is available"