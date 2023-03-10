#!/bin/bash

# Install dependencies
yum install -y curl

# Download kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Install kubectl
chmod +x kubectl
mv kubectl /usr/local/bin/
