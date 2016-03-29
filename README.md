# Voting solution

## Intallation
* Install Docker Toolbox (docker-machine && docker-compose)
* Create a new Docker VM: `command here`
* Get the URL of docker host by running docker-machine ls
* Export URL into environment: `export DOCKER_HOST=tcp://your.docker.host.ip:port`
* Run `docker-compose up -d`
* In a different terminal window run `bundle install`
* Copy `config/openblockchain.yml.example` into `config/openblockchain.yml`
* Replace `blockchain_api_url` with `http://<YOUR_DOCKER_HOST_IP>:3005`
* And launch Sinatra app: `rackup config.ru -p 3000`
* Check the logs of the app: you should see long string with chaincode ID, copy it
* Replace `blockchain_id` in `config/openblockchain.yml` with this hash you've just copied
