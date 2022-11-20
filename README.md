Use `docker-compose` with the compose file in the [`docker` directory](/docker/) to bootstrap 4 ubuntu-based ssh-enabled containers in a predetermined docker network.<br>
Then, run the playbooks in the [`ansible` directory](/ansible/) to install consul and nomad in the containers, and set up the cluster.<br>
Finally, use the job declarations in the [`nomad` directory](/nomad/) to deploy jobs on the newly created local cluster.<br>
<br>
The cluster is not persistent and all the data will be lost upon shutting down the containers. This is for testing and development purposes only.

```shell
export NOMAD_ADDR=http://10.0.100.254:4646
```