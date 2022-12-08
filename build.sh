#!/bin/bash

source .env_template;
KAFKA_IMAGE="${DOCKERHUB_ACCOUNT}/${KAFKA_IMAGE_NAME}";
KAFKA_TAGGED_IMAGE="${KAFKA_IMAGE}:${KAFKA_IMAGE_VERSION}";
if [ -z "$(docker images | grep ${KAFKA_IMAGE})" ]; then
    cd kafka;
    docker build -t ${KAFKA_TAGGED_IMAGE} .;
    cd ..;
fi

# Push the image if needed
# docker push ${KAFKA_TAGGED_IMAGE}

echo "${KAFKA_TAGGED_IMAGE} is ready ✅";
