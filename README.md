# LocalKube
Kubernetes playground

## MicroK8s

### Installation Steps:

Install MicroK8s:

    sudo snap install microk8s --classic
    
Add User to MicroK8s Group (Optional for non-root):

    sudo usermod -a -G microk8s $USER
    sudo chown -f -R $USER ~/.kube
    newgrp microk8s

Check Status:

    microk8s status --wait-ready
    Enable Add-ons (Optional):

microk8s enable dns dashboard
Check Cluster:

    microk8s kubectl get nodes


### Removing MicroK8s

To remove MicroK8s, the process depends on its distribution method, which is generally as a Snap package.

Remove MicroK8s Snap Package:

    sudo snap remove microk8s

Remove Users from MicroK8s Group:

    sudo deluser <your-username> microk8s

Remove Remaining Configurations (Optional):
Remove any remaining configuration or data files related to MicroK8s. 
Note that this step is generally safe but may delete configurations that you might want to keep.

    sudo rm -rf /var/snap/microk8s
    sudo rm -rf ~/.kube

General Clean Up

Whether using Kind or MicroK8s, you may also want to clean up Docker images and containers to free up space.

Remove Unused Docker Resources:

    docker system prune -a

This command will remove:

* All stopped containers
* All networks not used by at least one container
* All images without at least one container associated to them
* All build cache

Verify Removal:

Ensure that no Docker resources related to your Kubernetes setup remain:

docker ps -a
docker images
docker volume ls
docker network ls

Optional: Reboot Your System:

A reboot can help clear out any lingering system states and confirm that all services have been properly removed.
