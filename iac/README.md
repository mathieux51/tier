## Getting started


### First run

The first time terraform runs, terraform backend doesn't exist yet so make sure
the following code is commented:

```
terraform {
  backend s3 {}
}
```
