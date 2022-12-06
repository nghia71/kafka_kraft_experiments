#!/bin/sh

echo "Setup Storage UUID ...";
KAFKA_STORAGE_UUID="$(cat /proc/sys/kernel/random/uuid | tr -d '-' | base64 | cut -b 1-22)"
sed -i 's/KAFKA_STORAGE_UUID=/KAFKA_STORAGE_UUID='${KAFKA_STORAGE_UUID}'/' .env
echo "Storage UUID is set to ${KAFKA_STORAGE_UUID} ✅";

echo "Create volumes for data and logs ...";
for i in 1..3
do
    mkdir -p ./vol${i}/kafka-data
    mkdir -p ./vol${i}/kafka-logs
    chown -R $(id -u):$(id -g) ./vol${i}/kafka-data
    chown -R $(id -u):$(id -g) ./vol${i}/kafka-logs
done
echo "Volumes for data and logs are created ✅";