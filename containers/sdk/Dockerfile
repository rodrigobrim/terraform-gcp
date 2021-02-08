ARG image_version=stable-slim
FROM debian:${image_version}

ENV gcp_sdk_path=/google-cloud-sdk
ENV gcloud=${gcp_sdk_path}/bin/gcloud
ENV debian_release=buster

RUN apt-get update || true \
 && apt-get install -y python3 curl gnupg software-properties-common \
 && mkdir /.config \
 && chown 1001 /opt /.config

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - \
 && apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com ${debian_release} main" \
 && apt-get update || true \
 && apt-get install -y terraform \
 && apt-get clean

RUN ln -s /${gcp_sdk_path}/bin/gcloud /usr/local/bin
