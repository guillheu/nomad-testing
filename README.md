Use `docker-compose` with the compose file in the [`docker` directory](/docker/) to bootstrap 4 ubuntu-based ssh-enabled containers in a predetermined docker network.<br>
Then, use ansible to run the playbooks that will install consul, nomad and set up the clusters.

```shell
export NOMAD_ADDR=http://10.0.100.254:4646
```