## Configuring Jenkins

- Get the password to proceed installation:

   ```bash
   docker logs helix.ci | less
   ```

- Go to <http://localhost:8080/> and enter the password

## Configuring Jenkins Agent

- Use ssh-keygen to create a new key pair:

   ```bash
   ssh-keygen -t rsa -f jenkins_key
   ```

- Go to Jenkins and to **Manage jenkins** > **Manage credentials**.

- Go to Jenkins, under **Stores scoped to Jenkins**, click **Global credentials**, next click **Add credentials** and set the following options:

   - Select **SSH Username with private key**.
   - Limit the scope to **System**.
   - Give the credential an **ID**.
   - Provide a **description**.
   - Enter a **username**.
   - Under Private Key check **Enter directly**.
   - Paste the content of private key in the text box.

- Click **Ok** to save.

- Paste the public key on the **JENKINS_AGENT_SSH_PUBLIC_KEY** variable, in the **.env** file.

- Recreate the services:

   ```bash
   docker-compose down helix.ci.agent
   docker-compose up --build -d
   ```