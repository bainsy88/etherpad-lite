from registry.ng.bluemix.net/ibmnode:latest

# Install other required packages
run apt-get -y update
run apt-get -y install curl git-core python libssl-dev pkg-config build-essential software-properties-common python-software-properties

# Install etherpad-lite
run rm -rf /src
run mkdir /src
run git clone https://github.com/ether/etherpad-lite.git /src/etherpad-lite --branch develop --single-branch
add ./ /src/etherpad-lite/
run etherpad-lite/bin/installDeps.sh

expose  :9080

entrypoint  ["/src/etherpad-lite/bin/run.sh", "--root"]