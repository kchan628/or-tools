package sat

import "testing"

func TestCpModel_Validate(t *testing.T) {
	cpModel := NewCpModel()
	name := "test"
	cpModel.SetName(name)

	if name != cpModel.Name() {
		t.Errorf("name %s != %s", name, cpModel.Name())
	}

	result := cpModel.Validate()

	t.Log(result)
}
