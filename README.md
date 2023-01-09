# Helix-Core

### Setup p4d

- First add the perforce packaging key to the apt keyrings:
    ```bash
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://package.perforce.com/perforce.pubkey | sudo gpg --dearmor -o /etc/apt/keyrings/perforce.gpg
    ```

- Then add the perforce repositories to your apt configuration:
    ```bash
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/perforce.gpg] http://package.perforce.com/apt/ubuntu $(lsb_release -cs) release \
    deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/perforce.gpg] http://package.perforce.com/apt/ubuntu focal release" \
    | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    ```

- Lastly:
    ```bash
    sudo apt update
    sudo apt install helix-p4d -y
    sudo /opt/perforce/sbin/configure-helix-p4d.sh
    ```

### Setup swarm

- Swarm requires `php7.4`, to install it:
    ```bash
    sudo apt update && sudo apt upgrade
    sudo apt install software-properties-common
    sudo add-apt-repository ppa:ondrej/php -y
    sudo apt install php7.4
    sudo apt install php7.4-{cli,common,curl,zip,gd,mysql,xml,mbstring,json,intl,redis}
    ```

- Set `php7.4` as default:
    ```bash
    sudo update-alternatives --config php
    ```

- Lastly create `.env` file following `example.env` and run `docker compose up --build -d`


### Links
Navigate to `http://localhost:80` to see swarm dashboard.
