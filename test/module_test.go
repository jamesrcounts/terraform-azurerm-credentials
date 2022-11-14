package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestCredentials(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/default",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	// TODO: Assertions
	actualName := terraform.Output(t, terraformOptions, "credentials")

	assert.Equal(t, "ws-test", actualName)
}

// TODO 1: Test that SP gets owner role on the test rg.