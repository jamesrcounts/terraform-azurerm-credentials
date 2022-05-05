default: test

# User configurable
REPOSITORY := github.com/jamesrcounts/terraform-azurerm-credentials
SUBSCRIPTION := "Jim Counts (personal)"

# Aliases
AZ_LOGIN := ${HOME}/.azure/msal_token_cache.json
GO_MOD := test/go.mod
GO_SUM := test/go.sum

# Targets
$(AZ_LOGIN):
	az login
	az account set --subscription $(SUBSCRIPTION)
	az account show --output table

tf_fmt:
	terraform fmt -recursive

$(GO_MOD):
	cd test && go mod init "$(REPOSITORY)"

$(GO_SUM): $(GO_MOD)
	cd test && go mod tidy

go_fmt: $(GO_SUM)
	cd test && go fmt

fmt: tf_fmt go_fmt

test: $(AZ_LOGIN) $(GO_SUM) fmt
	cd test && go test -v
