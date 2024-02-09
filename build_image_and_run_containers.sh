set -x
set -e

export IMAGE_NAME=supersqa_testlink
export VOLUME_DIR_TESTLINK=$(pwd)/volume_testlink
export VOLUME_DIR_MYSQL=$(pwd)/volume_mysql


echo "Building the image ......"
docker build -t $IMAGE_NAME .


echo "Running containers using docker-compose ...."
docker-compose up -d

# display container info
docker ps

# make the volumes writable by webserver user
chown -R www-data ${VOLUME_DIR_TESTLINK}
