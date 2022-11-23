### Motivation
Docker has several limitations :
 * Nomad itself relies on Docker engine for most of its deployments. Having Docker engine work in a container requires using a Docker in Docker (DinD) container image for the guests. Those guests also require `privileged` mode, which is a major security concern, even for a testing lab. Also for some reason, using privileged mode on that many containers seems to break them or something idk
 * Imprecise networking. All the containers are currently being ran in the same bridged network. Not ideal to test out cases of remote DCs and regions.
 * The Ubuntu docker image does not ship with important features like `systemd` or native `ssh` server.
 * Containers report inaccurate CPU and RAM limitations to Nomad.

Thus, I decided to switch the lab setup to [Firecracker](https://github.com/firecracker-microvm/firecracker)