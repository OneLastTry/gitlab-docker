# GitLab Docker Sample Deployment

This is just a sample deployment of GitLab with 4 runner nodes for CI/CD using docker compose.
To start copy/rename [sample.env](/sample.env) into *.env* and change the values to reflect your deployment. Once that is done simply issue `docker-compose up -d`

Once everything is up and running you can find the root password by executing:

```bash
sudo docker exec -it gitlab_gitlab-web_1 grep 'Password:' /etc/gitlab/initial_root_password
```

If you wish to enable CI/CD you can regiter the runners by providing the token and the URL to your GitLab deployment like below:

```bash
sudo docker exec -it gitlab_gitlab-runner_1 gitlab-runner register --url https://my-domain.com/ --registration-token [TOKEN]
```

To create SSL certificate files execute below from *encore* directory:

```bash
HOSTNAME=my-domain.com \
&& openssl req -x509 -out persistent/certs/${HOSTNAME}.crt \
    -keyout persistent/certs/${HOSTNAME}.key \
    -newkey rsa:2048 -nodes -sha256 -days 365 \
    -subj "/CN=${HOSTNAME}" \
    -extensions EXT \
    -config <(printf "[dn]\nCN=${HOSTNAME}\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:${HOSTNAME}\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")
```
