# idunion.infrastructure

Infrastructure of IDUnion like VM images to run the k3s-cluster.

# Infrastructure

Infrastructure gets created with Hashicorps Packer. The self-made images will be deployed with Terraform in the Cloud. At the moment this is the Hetzner Cloud because of its low price and currently sufficient opportunities.

### Building images

Images are built with Packer in the HCloud.

To build the k3s-image you need to run the following command. It is wise to pass a version string which will be added as `version` label to the built image.

```bash
# JSON packer configurations for the HCloud work apparently only with Packer <=v1.4.5
packer build -var VERSION=$(git log -1 --format=%H) -var TOKEN=$(cat .hcloud.token) -var PROJECT="idunion" packer/k3s/
```

This creates a snapshot of the built image in the Hetzner Cloud.