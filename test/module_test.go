package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestTerraformHelloWorldModule(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../examples",
		VarFiles:     []string{"varfile.tfvars"},
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	message := terraform.Output(t, terraformOptions, "message")
	
	assert.NotEmpty(t, message)
	assert.Regexp(t, "^Hello, .*!", message)
}
