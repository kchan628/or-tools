package sat

import "github.com/kchan628/or-tools/go/sat/gen"

type cpModel struct {
	proto gen.CpModelProto
}

func NewCpModel() *cpModel {
	return &cpModel{
		proto: gen.CpModelProto{},
	}
}

func (m *cpModel) SetName(name string) {
	m.proto.Name = name
}

func (m *cpModel) Name() string {
	return m.proto.Name
}

func (m *cpModel) Validate() string {
	return gen.SatHelperValidateModel(m.proto)
}
