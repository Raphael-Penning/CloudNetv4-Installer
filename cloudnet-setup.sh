echo "\e[94m[CloudNet Setup]\e[0m Updating and Upgrading"
apt update && apt upgrade -y
echo "\e[94m[CloudNet Setup]\e[0m Installing \e[90mScreen Btop Unzip & Nano\e[0m"
apt install screen btop unzip nano -y
echo "\e[94m[CloudNet Setup]\e[0m Installing \e[90mJava 17\e[0m"
apt install openjdk-17-jre-headless -y
echo "\e[94m[CloudNet Setup]\e[0m Creating folder \e[90m/var/lib/CloudNet\e[0m"
mkdir /var/lib/CloudNet
echo "\e[94m[CloudNet Setup]\e[0m Going to \e[90m/var/lib/CloudNet\e[0m"
cd /var/lib/CloudNet
read -p "Which version do you want? Possible answers: v3 , v4" cloudnetversion
if(cloufnetversion = "v3")
then
echo "\e[94m[CloudNet Setup]\e[0m Downloading \e[90mCloudNet v3.4.5\e[0m"
wget -q --show-progress https://github.com/CloudNetService/CloudNet-v3/releases/download/v3.4.5/CloudNet.zip
else
echo "\e[94m[CloudNet Setup]\e[0m Downloading \e[90mCloudNet v4\e[0m"
wget -q --show-progress https://github.com/CloudNetService/CloudNet-v3/releases/download/4.0.0-RC9/CloudNet.zip
fi
echo "\e[94m[CloudNet Setup]\e[0m Unzipping"
unzip CloudNet.zip >/dev/null
echo "\e[94m[CloudNet Setup]\e[0m Removing \e[90mCloudNet.zip\e[0m"
rm CloudNet.zip -R
echo "\e[94m[CloudNet Setup]\e[0m Done."
echo "\e[94m[Deleting Start.sh]\e[0m"
rm start.sh
echo "\e[94m[Downloading new Start.sh]\e[0m"
wget -q --show-progress  https://raw.githubusercontent.com/Raphael-Penning/CloudNetv4-Installer/main/start.sh
echo "\e[94m[Installing Crontab]\e[0m"
wget -q --show-progress https://raw.githubusercontent.com/Raphael-Penning/CloudNetv4-Installer/main/crontab /var/spool/cron/crontabs/root
mv crontab /var/spool/cron/crontabs/root
echo "\e[94m[Cleanup]\e[0m"
rm /var/lib/CloudNet/start.bat
rm /var/lib/CloudNet/start.command
