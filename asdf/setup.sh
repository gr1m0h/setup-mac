#!/usr/bin/env bash
goversion=${1:-"1.12.1"}
cp -p tool-versions ~/.tool-versions
echo -e "# asdf setting\n. $HOME/.asdf/asdf.sh\n. $HOME/.asdf/completions/asdf.bash\n" >> ~/.bashrc
echo -e "# golang\nexport GO111MODULE=on\nexport GOROOT=$HOME/.asdf/installs/golang/<GOVERSION>/go\nexport GOPATH=$HOME/.go\nexport PATH=$GOPATH/bin:$PATH\n" >> ~/.bashrc
echo -e "# kubectl\nexport KUBECONFIG=$HOME/.kube/config/config.yaml\n" >> ~/.bashrc
grep -l "<GOVERSION>" ~/.bashrc | xargs sed -i.bak -e "s/<GOVERSION>/$goversion/g"
