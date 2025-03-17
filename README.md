# ~~🏠💪 Homelab~~ 🏭🦾 Cololab 🥷🚀

Welcome to my journey of learning automation tools such as Terraform, Ansible, Kubernetes and many more.

My homelab is an old i5 16GB MacBook Pro from 2017. This device stated giving me trouble in my day to day work so
decided to turn it into a Ubuntu Server few years back. Played with it over the years but it was always unstable.
The hardware was damaged and it crashed frequently. The WiFi driver dropped connection. Even though the job of
that machine was to let me experiment and help me learn, most of the time I found myself fixing it. Which was a
bit furstrating. But I needed to learn new things...

I asked around, and one company agreed to help me with some nodes ([Check Sponsors](#sponsors)). The journey
begins! I'll be sharing my day to day lessons on this repository and on my [blog](https://iammahir.com). While
this repository will have more of the practical things, like running the project and CI/CD, I'll cover more
details in my blog. I'll link relevant blog posts in relevant parts. Most of it, you can use directly.
Some of it, you might need to modify to fit your needs.

## Provisioning the nodes (With Terraform)

I want to try out K3s clustered installation. Hence, I will need multiple nodes to host my k3s. I've been graciously
provide 4 nodes to play with. But those nodes were not created and built for me, I had to manually create the
nodes and install OS. There is no way I was going to do that by clicking on a website.

I asked the company owner if I could have an API key. In exchange for doing some System Admin work for them,
the company provided me with an API key. But if you're following along, and using something like AWS, Azure or
Oracle Cloud you can directly use Terraform.

The company uses [VirtFusion](https://virtfusion.com/) as their management console. Before searching on google,
I thoguht to myself that this is not a popular tool and I migth get the experience of writing
[Terraform Providers](https://developer.hashicorp.com/terraform/language/providers) since there might not be
a provider for this platform. But I was wrong, there was a
[VirtFusion Terraform Provider](https://registry.terraform.io/providers/EZSCALE/virtfusion/latest)
available though with very limited features. But enough to fullfil my task for now. I might have to fork and
extend it if I want to do more things.

**This is one of the sections which you might not be able to use directly.**

Anyways, enough babling, let's get into how I run the
[Terraform](https://github.com/m4hi2/homelab/tree/master/terraform-virtfusion) project.

```shell
# Let's go into the project directory first
cd terraform-virtfusion

# Initialize Terraform & download provider
terraform init

# To be save, I didn't commit anything sensitive. That means, no api key.
# You have to create your environment files. Copy my example and edit it.
cp terraform.tfvars.example terraform.tfvars

# Now we can edit the terraform.tfvars file
# You can use any editor you like, I'm going to use vim
vim terraform.tfvars

# Have to put in right values for the 4 variables. Pretty self explanatory.
# Now we can run the terraform plan to make sure everything looks all right
terraform plan -var-file="terraform.tfvars"

# After reviewing the plan we can apply the plan to create our desired nodes
terraform apply -var-file="terraform.tfvars"

# You'll be promted to type "yes", do that and everything should work!
```

Considering everything went as planned, we should now have 4 nodes! Great!

## Sponsors

- [HostOmega](https://hostomega.com): 4 nodes (2 Core/2GB RAM/30GB SSD )
