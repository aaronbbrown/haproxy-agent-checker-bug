#!/usr/bin/env bash

cleanup() {
  docker-compose down
  docker-compose rm
  exit
}

trap cleanup INT TERM
docker-compose up -d

sleep 10
echo "==== GOOD ===="
echo "== haproxy 2.1"
curl -s 'http://localhost:1937/;csv' | grep server1
echo
echo "== haproxy 2.2"
curl -s 'http://localhost:1936/;csv' | grep server1

docker-compose stop nginx

sleep 10
echo "==== BAD ===="
echo "== haproxy 2.1 (correct, should be DOWN)"
curl -s 'http://localhost:1937/;csv' | grep server1
echo
echo "== haproxy 2.2 (incorrect, showing UP)"
for i in {1..20}; do
  curl -s 'http://localhost:1936/;csv' | grep server1
  sleep 1
done
