from registry.ng.bluemix.net/ibmnode:latest

# Install other required packages
run apt-get -y update
run apt-get -y install curl git-core python libssl-dev pkg-config build-essential software-properties-common python-software-properties

# Install etherpad-lite
run rm -rf /src
run mkdir /src
add ./ /src/etherpad-lite/
run /src/etherpad-lite/bin/installDeps.sh
expose  :9080

entrypoint  ["/src/etherpad-lite/bin/run.sh", "--root"]
