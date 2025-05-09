#!/bin/bash

# Update and upgrade system packages
printf "\n\033[1;34m[Step 1] Updating system packages...\033[0m\n"
sudo apt-get update && sudo apt-get upgrade -y

# Install Python, pip, venv, and Git
printf "\n\033[1;34m[Step 2] Installing Python, pip, venv, and Git...\033[0m\n"
sudo apt install -y python3-pip python3-venv git

# Install Nginx
printf "\n\033[1;34m[Step 6] Installing Nginx...\033[0m\n"
sudo apt install -y nginx
sudo rm * /etc/nginx/sites-available/
sudo mv default.conf /etc/nginx/sites-available/

# Clone your repository
printf "\n\033[1;34m[Step 3] Cloning project repository...\033[0m\n"
git clone https://github.com/Ahmetereni/Innovative-Solutions.git
# Set up virtual environment and activate it
printf "\n\033[1;34m[Step 4] Setting up virtual environment...\033[0m\n"
python3 -m venv .venv
source .venv/bin/activate
printf "\n\033[1;34m[Step 4] Requirements.txt...\033[0m\n"

cd Innovative-Solutions  || echo "cd Innovative-Solutions errororororr  Errrooorrrrrr!!!!!!!!!!!!!"
pip install -r requirements.txt

# Install Gunicorn
printf "\n\033[1;34m[Step 5] Installing Gunicorn...\033[0m\n"
pip install gunicorn

gunicorn -w 4 -b 0.0.0.0:5000 'application:create_app()'





# Final instructions
printf "\n\033[1;32m[✔] Installation complete!\033[0m\n"
printf "\n\033[1;33mNext steps:\033[0m\n"
printf "1. \033[1mEdit your Nginx configuration file:\033[0m\n"
printf "   Run: \033[0;36msudo vim /etc/nginx/sites-available/default\033[0m (or your custom config file)\n\n"

printf "2. \033[1mRun Gunicorn manually:\033[0m\n"
printf "   \033[0;36mgunicorn -w 4 -b 0.0.0.0:5000 'application:create_app()'\033[0m\n\n"

printf "3. \033[1mSet up Gunicorn as a systemd service:\033[0m\n"
printf "   Run: \033[0;36msudo vim /etc/systemd/system/MyGunicornService.service\033[0m\n"
printf "   Paste the appropriate service config (replace paths and user as needed)\n\n"

printf "4. \033[1mEnable and start the Gunicorn service:\033[0m\n"
# sudo mv MyGunicornService.service /etc/systemd/system
printf "   \033[0;36msudo systemctl daemon-reload\033[0m\n"
printf "   \033[0;36msudo systemctl enable MyGunicornService\033[0m\n"
printf "   \033[0;36msudo systemctl start MyGunicornService\033[0m\n\n"

printf "\033[1;32mAll done! 🎉\033[0m\n\n"
