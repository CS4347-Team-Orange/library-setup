# Terraform

These Terraform modules are configured for use in [Terraform Cloud "TFC"](https://app.terraform.io)

You should set the `TF_ORG` appropriately if you're running in your own TFC organization.

# terraform init

The Terraform projects in this system use [Partial Configuration](https://www.terraform.io/language/settings/backends/remote#using-cli-input) of the Terraform Cloud backend.

```
cp config.remote.tfbackend.tpl config.remote.tfbackend
sed -i "s#TF_ORG#alex4108#g" config.remote.tfbackend
sed -i "s#TF_WORKSPACE#library-${USER}#g" config.remote.tfbackend
sed -i "s#TF_HOST#app.terraform.io#g" config.remote.tfbackend
terraform init -backend-config="config.remote.tfbackend"
```

# terraform plan

```
echo "stage = \"${USER}\"" > ./${USER}.auto.tfvars
echo "vpc_prefix = \"10.2\"" > ./${USER}.auto.tfvars
terraform plan
```

