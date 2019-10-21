#!/usr/bin/env bash

# Copyright 2018 The KubeSphere Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

echo "*************************"
echo "update docker images"
echo "*************************"

systemctl start docker
docker login -u guest -p guest dockerhub.qingcloud.com

# Basic
docker pull dockerhub.qingcloud.com/google_containers/hyperkube:v1.15.5
docker pull dockerhub.qingcloud.com/google_containers/pause:3.1
docker pull dockerhub.qingcloud.com/kubernetes_helm/tiller:v2.12.3

# Network
docker pull dockerhub.qingcloud.com/google_containers/coredns:1.3.1
docker pull dockerhub.qingcloud.com/calico/node:v3.8.4
docker pull dockerhub.qingcloud.com/calico/cni:v3.8.4
docker pull dockerhub.qingcloud.com/calico/kube-controllers:v3.8.4
docker pull dockerhub.qingcloud.com/calico/pod2daemon-flexvol:v3.8.4
docker pull dockerhub.qingcloud.com/coreos/flannel:v0.11.0-amd64
docker pull kubesphere/cloud-controller-manager:v1.3.6

# HPA
docker pull dockerhub.qingcloud.com/google_containers/cluster-proportional-autoscaler-amd64:1.3.0

systemctl stop docker