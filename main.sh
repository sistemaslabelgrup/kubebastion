echo "Update repos and install dependencies"
apt update -y
apt install apt-transport-https ca-certificates gnupg

echo "Install kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

echo "Install helm"
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

echo "Install GCP CLI"
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-cli -y
gcloud components install gke-gcloud-auth-plugin
gke-gcloud-auth-plugin --version
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

echo "Install kubent"
curl -sSL https://git.io/install-kubent | bash

echo "Install K9s"
curl -sS https://webi.sh/k9s | bash
cp /root/.local/bin/k9s /usr/local/bin/k9s
