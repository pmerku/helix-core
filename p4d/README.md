### Setup p4d

- Add the perforce packaging key to the apt keyrings:
    ```bash
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://package.perforce.com/perforce.pubkey | sudo gpg --dearmor -o /etc/apt/keyrings/perforce.gpg
    ```

- Add the perforce repositories to your apt configuration:
    ```bash
    printf \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/perforce.gpg] http://package.perforce.com/apt/ubuntu $(lsb_release -cs) release\n \
    deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/perforce.gpg] http://package.perforce.com/apt/ubuntu focal release" \
    | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    ```

- Run:
    ```bash
    sudo apt update
    sudo apt install helix-p4d -y
    sudo /opt/perforce/sbin/configure-helix-p4d.sh
    ```

    Make sure to select unicode mode for swarm!!

- Connect to your p4 instance via p4-client and setup depots and users from there

- For swarm to connect with a password:
    ```bash
    p4 configure set auth.sso.allow.passwd=1
    ```

- Configure typemap on depot:
    ```bash
    p4 typemap
    ```
