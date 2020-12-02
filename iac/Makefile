.DEFAULT_GOAL := help
.PHONY: help init init_with_backend check format plan apply plan_and_apply clean destroy

help: ##Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' | awk -F ":" '{ printf "%-20s %s\n", $$1, $$2 }'

TF_INIT=terraform init

init: ##Initialize terraform.
	terraform --version
	$(TF_INIT)

init_with_backend: ##Override init target. Add -backend-config flag to inject backend's bucket name.
	$(TF_INIT) -backend-config=backend-config.hcl

check: ##Validate the configuration files in a directory.
	terraform fmt -recursive -check -diff
	terraform validate

format: ##Recursively format .tf files.
	terraform fmt -recursive

plan: ##Create a terraform plan file.
	terraform plan -out "planfile"

apply: ##Apply terraform plan.
	terraform apply -auto-approve -input=false "planfile"

plan_and_apply: plan apply  ##Run terraform plan then terraform apply.

clean: ##Remove terraform files.
	rm -rf terraform.tfstate plan .terraform crash.log terraform.tfstate.backup planfile

destroy: ##Run terraform destroy.
	terraform destroy -auto-approve
