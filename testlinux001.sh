sudo apt-get update && apt-get upgrade
sudo apt-get install apt-transport-https curl gnupg -yqq
echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list
echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/scalasbt-release.gpg --import
chmod 644 /etc/apt/trusted.gpg.d/scalasbt-release.gpg
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

cd ..

cp `find . -name AmmExecutor-*.jar` Amm-executor/Amm-executor.jar
cp `find . -name PoolResolver-*.jar` Pool-resolver/Pool-resolver.jar
cp `find . -name UtxoTracker-*.jar` Utxo-tracker/Utxo-tracker.jar

sudo rm -rf ergo-dex-backend

cp amm.conf Amm-executor/application.conf
cp pool.conf Pool-resolver/application.conf
cp utxo.conf Utxo-tracker/application.conf