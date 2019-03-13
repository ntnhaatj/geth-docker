FROM ubuntu:16.04
MAINTAINER ntnhaatj

# Using server mirror to boost up process
ENV APT_MIRROR http://opensource.xtdv.net/ubuntu
RUN sed -i "s|http://archive.ubuntu.com/ubuntu|${APT_MIRROR}|g" /etc/apt/sources.list

RUN apt-get update -y
RUN apt-get install -y software-properties-common

# Blockchain dependencies installation
RUN add-apt-repository -y ppa:ethereum/ethereum
RUN apt-get update
RUN apt-get install -y ethereum

EXPOSE 8545
EXPOSE 30303

CMD ["geth", "--rpc --rpccorsdomain '*' --rpcapi 'net,eth,web3,miner,personal' --rpcaddr 0.0.0.0 --cache=512 --rinkeby"]
