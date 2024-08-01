# google-drive-ocaml
GDRIVE_ID=""
GDRIVE_SECRET=""
google-drive-ocamlfuse -id [id] -secret [secret]
mkdir ~/gdrive
google-drive-ocamlfuse /home/sumeshi96/gdrive

# nextcloud
mkdir ~/nextcloud
sudo mount -t davfs https://nextcloud.sumeshi.site/remote.php/webdav/ ~/nextcloud
echo "https://nextcloud.sumeshi.site/remote.php/webdav/ /home/$USER/nextcloud davfs user,rw,auto,uid=1000,gid=1000 0 0" >> /etc/fstab
echo "/home/$USER/nextcloud [username] [password]" >> /etc/davfs2/secrets 
sudo chmod 600 /etc/davfs2/secrets

## docker
sudo groupadd docker
sudo gpasswd -a $USER docker
sudo systemctl restart docker

# tailscale 
TAILSCALE_AUTH_KEY=""
sudo tailscale up --authkey $TAILSCALE_AUTH_KEY

# Node.js
volta install node@latest
volta install yarn@latest

# zsh 
chsh -s $USER /bin/zsh
source ~/.zshrc
