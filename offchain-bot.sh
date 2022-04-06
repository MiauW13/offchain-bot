mkdir Amm-executor
mkdir Pool-resolver
mkdir Utxo-tracker
git clone https://github.com/ergolabs/ergo-dex-backend.git
cd ergo-dex-backend
sbt amm-executor/assembly
sbt pool-resolver/assembly
sbt utxo-tracker/assembly
cd ~/offchain-bot

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

sudo curl https://dlcdn.apache.org/kafka/3.1.0/kafka_2.12-3.1.0.tgz -o kafka.tgz
sudo tar xhf kafka.tgz
sudo rm -rf kafka.tgz
 

