sudo apt-get update
sudo apt-get install apt-transport-https curl gnupg -yqq
echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | sud>
echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | sudo tee />
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2E>
sudo chmod 644 /etc/apt/trusted.gpg.d/scalasbt-release.gpg
sudo apt-get update
sudo apt-get install sbt

 sudo apt-add-repository ppa:redislabs/redis
 sudo apt-get update
 sudo apt-get upgrade
 sudo apt-get install redis-server
 sudo service redis-server restart

mkdir Amm-executor
mkdir Pool-resolver
mkdir Utxo-tracker
git clone https://github.com/ergolabs/ergo-dex-backend.git
cd ergo-dex-backend
sbt amm-executor/assembly
sbt pool-resolver/assembly
sbt utxo-tracker/assembly
cd ~/test
sudo cp `find . -name AmmExecutor-*.jar` Amm-executor/Amm-executor.jar
sudo cp `find . -name PoolResolver-*.jar` Pool-resolver/Pool-resolver.jar
sudo cp `find . -name UtxoTracker-*.jar` Utxo-tracker/Utxo-tracker.jar

sudo rm -rf ergo-dex-backend

sudo cp amm.conf Amm-executor/application.conf
sudo cp pool.conf Pool-resolver/application.conf
sudo cp utxo.conf Utxo-tracker/application.conf

sudo rm -rf amm.conf
sudo rm -rf pool.conf
sudo rm -rf utxo.conf
 

