# Setup guide

## Before you begin

### Tools

Make sure to install the following tools on your machine:

* [Install Skaffold](https://skaffold.dev/docs/install/)
* [Install kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
* [Install minikube](https://minikube.sigs.k8s.io/docs/start/)

### Submodules

1. Fork the repositories you want to work on.
2. Configure the remotes for the included submodules.
    1. Run: `$ git remote rename origin upstream`
    2. followed by: `$ git remote add origin [your-fork]`
    3. and: `git push -u origin --all` to set de default upstream.
    
### Setup Minikube (Local cluster)

Set the default driver for Minicube to Hyperkit. You will already have Hyperkit installed if you use Docker Desktop.

```bash
$ minikube config set vm-driver hyperkit
```

Start and stop Minicube as follows:

```bash
$ minikube start|stop
```

#### Conflicts with DnsMasq

A solution [found on GitHub](https://github.com/kubernetes/minikube/issues/3104#issuecomment-420830490):

> On OSX i found that running dnsmasq and setting the listen-address=192.168.64.1 worked for me. The problem seemed an issue with network traffic not being able to get out and reach the internet to pull the docker images.

- `minikube delete && rm -rf ~/.minikube ~/.kube`
- `sudo rm /var/db/dhcpd_leases`
- `vim /usr/local/etc/dnsmasq.conf` and edit to taste. (uncomment listen-address and set it to the gateway)

## Run the dev-env

Start Skaffold (with file watcher) by running the following command in the root of the 'dev' repo.

```bash
$ skaffold dev
```

Start Minikube tunnel in another terminal window to assign external IP's to every load balancer.

```bash
$ minikube tunnel
```