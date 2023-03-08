set -x

local_app_root_dir=${PWD}
echo "Local App Root Dir: ${local_app_root_dir}"



docker run \
--name testlink  \
-p 8080:8080 \
--volume ${local_app_root_dir}:/var/www/html \
--volume ${local_app_root_dir}/logs:/var/testlink/logs \
--volume ${local_app_root_dir}/upload_area:/var/testlink/upload_area \
-d ssqatestlink


# docker run \
# --name testlink  \
# -p 8080:8080 \
# --volume $LOCAL_VOLUME_PATH:/var/www/html \
# -d ssqatestlink
