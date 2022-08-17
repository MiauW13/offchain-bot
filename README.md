# Ergo-Dex offchain-bot without docker on mobile phone

This guidence come from my own issue which is i want to run the Dex offchain bot on the mechine that cannot suport docker, maybe someone out there have same problem as I did, and want to run offchain bot without docker




# Prerequisites

there are some requirment before we can run our script and make the bot working
  1.	GIT to clone the script from here
2.	Sbt should install befor you run the script. SBT or you can run the script that I provide
3.	Redis you can download it here or you also can run it from the script on this repo 
4.	Kafka you can download here or you can use the script on this repo too
5.	Java JDK to run the Jar file
6. 	this methode I use on mobile phone that have 4gb memory and 64bit processor

# SETUP

the first step you have to do is install termux on your mobile devices and ubuntu on termux, you can find the tutorial on this github link as follow :

https://github.com/MFDGaming/ubuntu-in-termux


Before start running script make sure you have setup the node running and synced with the currnet height.
To be honest it was way easier to use docker but if you have trouble with docker you can use this repo with several additional step as follow:
For Linux
  1.	clone the repo
      
            git clone https://github.com/MiauW13/offchain-bot.git
      
            cd offchain-bot
        
  2.	Install redis and run it
      
            chmod +x setup.sh
            
            ./setup.sh

  3.	run the offchain-bot script
            
            chmod +x offchain-bot.sh
            
            ./offchain-bot.sh
            
  4. open new terminal than run zookeeper with this command
	          
            cd kafka
            
            ./bin/zookeeper-server-start.sh ./config/zookeeper.properties
  5. open new terminal run kafka server with this command
	    
            ./bin/kafka-server-start.sh ./config/server.properties
  6.	before you run the bot you have to change the wallet addres on Amm-executor application.conf with yours
            
            cd Amm-executor 
            
            nano application.conf
  7.	run the jar file on each directory Amm-executor, Pool-resolver, and Utxo-tracker on diffrent terminal so you need open new terminal for each jar file to run
            
            cd Amm-executor
            
            java –jar Amm-executor.jar appliation.conf
            
            cd Pool-resolver
            
            sudo java –jar Pool-resolver.jar application.conf
            
            cd Utxo-tracker 
            
            java –jar Utxo-tracker.jar application.conf



# Conclusion
  Base on my experience it is easier to run it with docker as the official doc said but I found running it sparately like this is give us more acces to monitring the     image and identifying troubleshoot way more faster 

