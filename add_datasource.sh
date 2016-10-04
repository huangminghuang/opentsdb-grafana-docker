#!/bin/sh

GRAFANA_HOST="${GRAFANA_HOST:-grafana}"
TSDB_HOST="${TSDB_HOST:-opentsdb}"

echo "GRAFANA_HOST=$GRAFANA_HOST"
echo "TSDB_HOST=${TSDB_HOST}"

while ! curl --silent 'http://admin:admin@'$GRAFANA_HOST':3000/api/datasources' -X POST -H 'Content-Type: application/json;charset=UTF-8' --data-binary '{"name":"OpenTSDB","type":"opentsdb","url":"http://'$TSDB_HOST':4242","access":"proxy","isDefault":true}'
do
  sleep 1
done
