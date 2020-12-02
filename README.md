## Getting started

### Repository structure

```
tree
.
├── README.md
├── deployment
│   ├── Makefile
│   ├── aws-credentials-secret.yaml
│   ├── docker-registry-secret.yaml
│   ├── kustomization.yaml
│   ├── scripts
│   │   └── deploy.sh
│   ├── tool-job.yaml
│   └── tool-namespace.yaml
├── iac
│   ├── Makefile
│   ├── README.md
│   ├── backend-config.hcl
│   ├── init.tf
│   ├── main.tf
│   ├── store-me.txt
│   └── variables.tf
└── tool
    ├── Cargo.lock
    ├── Cargo.toml
    ├── Dockerfile
    ├── Makefile
    └── src
        └── main.rs

5 directories, 20 files
```

Each folder has a `Makefile` with a default help target, .i.e:

```
cd iac
make
```

will show the help for the iac folder.

### Requirements

What you need to run this repo: `make`, `terraform`, `minikube`, `kubectl`, `docker` and `cargo`
