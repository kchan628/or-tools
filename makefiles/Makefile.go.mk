# ---------- Golang support using SWIG ----------
.PHONY: help_go # Generate list of Go targets with descriptions.
help_go:
	@echo Use one of the following Go targets:
ifeq ($(SYSTEM),win)
	@$(GREP) "^.PHONY: .* #" $(CURDIR)/makefiles/Makefile.go.mk | $(SED) "s/\.PHONY: \(.*\) # \(.*\)/\1\ \2/"
	@echo off & echo(
else
	@$(GREP) "^.PHONY: .* #" $(CURDIR)/makefiles/Makefile.go.mk | $(SED) "s/\.PHONY: \(.*\) # \(.*\)/\1\ \2/" | expand -t24
	@echo
endif

GO_BIN = $(shell $(WHICH) go)
GO_PATH = $(shell [ -z "${GOPATH}" ] || echo $(GOPATH))
PROTOC_GEN_GO = $(shell test -f $(GOPATH)/bin/protoc-gen-go && echo $(GOPATH)/bin/protoc-gen-go)
GO_OR_TOOLS_NATIVE_LIBS := $(LIB_DIR)/$(LIB_PREFIX)goortools.$(SWIG_GO_LIB_EXT)

HAS_GO = true
ifndef GO_BIN
HAS_GO =
endif
ifndef GO_PATH
HAS_GO =
endif
ifndef PROTOC_GEN_GO
HAS_GO =
endif

# Main target
.PHONY: go # Build Go OR-Tools.
.PHONY: test_go # Test Go OR-Tools using various examples.
ifndef HAS_GO
go: detect_go
check_go: go
test_go: go
else
go: go_pimpl
check_go: check_go_pimpl
test_go: test_go_pimpl
BUILT_LANGUAGES +=, Golang
endif

$(GO_PATH)/src/github.com/google/or-tools-go/sat:
	-$(MKDIR_P) $(GO_PATH)$Ssrc$Sgithub.com$Sgoogle$Sor-tools-go$Ssat

$(GO_PATH)/src/github.com/google/or-tools-go/sat/cp_model.pb.go: \
 $(SRC_DIR)/ortools/sat/cp_model.proto \
 | $(GO_PATH)/src/github.com/google/or-tools-go/sat
	$(PROTOC) --proto_path=$(SRC_DIR) --go_out=$(GO_PATH)$Ssrc $(SRC_DIR)$Sortools$Ssat$Scp_model.proto

$(GO_PATH)/src/github.com/google/or-tools-go/sat/sat_parameters.pb.go: \
 $(SRC_DIR)/ortools/sat/sat_parameters.proto \
 | $(GO_PATH)/src/github.com/google/or-tools-go/sat
	$(PROTOC) --proto_path=$(SRC_DIR) --go_out=$(GO_PATH)$Ssrc $(SRC_DIR)$Sortools$Ssat$Ssat_parameters.proto

$(GEN_DIR)/ortools/sat/sat_go_wrap.cc: \
 $(SRC_DIR)/ortools/sat/go/sat.i \
 $(SRC_DIR)/ortools/base/base.i \
 $(SAT_DEPS) \
 | $(GEN_DIR)/ortools/sat $(GO_PATH)/src/github.com/google/or-tools-go/sat
	$(SWIG_BINARY) $(SWIG_INC) -I$(INC_DIR) -c++ -go -cgo \
 -o $(GEN_PATH)$Sortools$Ssat$Ssat_go_wrap.cc \
 -package github.com/google/or-tools-go/sat \
 -module sat \
 -outdir $(GO_PATH)$Ssrc$Sgithub.com$Sgoogle$Sor-tools-go$Ssat \
 -intgosize 64 \
 -v \
 -soname $(LIB_PREFIX)goortools.$(SWIG_GO_LIB_EXT) \
 $(SRC_DIR)$Sortools$Ssat$Sgo$Ssat.i

$(OBJ_DIR)/swig/sat_go_wrap.$O: \
	$(GEN_DIR)/ortools/sat/sat_go_wrap.cc \
	$(SAT_DEPS) \
	| $(OBJ_DIR)/swig
	$(CCC) $(CFLAGS) \
	-c $(GEN_PATH)$Sortools$Ssat$Ssat_go_wrap.cc \
	$(OBJ_OUT)$(OBJ_DIR)$Sswig$Ssat_go_wrap.$O

$(GO_OR_TOOLS_NATIVE_LIBS): \
 $(OR_TOOLS_LIBS) \
 $(OBJ_DIR)/swig/sat_go_wrap.$O
	$(DYNAMIC_LD) $(LD_OUT)$(LIB_DIR)$S$(LIB_PREFIX)goortools.$(SWIG_GO_LIB_EXT) \
 $(OBJ_DIR)$Sswig$Ssat_go_wrap.$O \
 $(OR_TOOLS_LNK) \
 $(OR_TOOLS_LDFLAGS)

go_pimpl: \
	$(GO_PATH)/src/github.com/google/or-tools-go/sat/cp_model.pb.go \
	$(GO_PATH)/src/github.com/google/or-tools-go/sat/sat_parameters.pb.go \
	$(GEN_DIR)/ortools/sat/sat_go_wrap.cc \
	$(GO_OR_TOOLS_NATIVE_LIBS)

test_go_pimpl:
	@echo test_go

check_go_pimpl:
	@echo check_go

################
##  Cleaning  ##
################
.PHONY: clean_go # Clean Go output from previous build.
clean_go:
	-$(DEL) $(GO_PATH)$Ssrc$Sgithub.com$Sgoogle$Sor-tools-go$Ssat$Ssat.go
	-$(DEL) $(GO_PATH)$Ssrc$Sgithub.com$Sgoogle$Sor-tools-go$Ssat$S*.pb.go
	-$(DEL) $(GEN_PATH)$Sortools$Ssat$S*go_wrap*
	-$(DEL) $(OBJ_DIR)$Sswig$S*go_wrap*
	-$(DEL) $(LIB_DIR)$S$(LIB_PREFIX)goortools.$(SWIG_GO_LIB_EXT)


#############
##  DEBUG  ##
#############
.PHONY: detect_go # Show variables used to build Go OR-Tools.
detect_go:
	@echo Relevant info for the Go build:
	@echo These must resolve to proceed
	@echo GO_BIN = $(GO_BIN)
	@echo GO_PATH = $(GO_PATH)
	@echo PROTOC_GEN_GO = $(PROTOC_GEN_GO)
	@echo GO_OR_TOOLS_NATIVE_LIBS = $(GO_OR_TOOLS_NATIVE_LIBS)

ifeq ($(SYSTEM),win)
	@echo off & echo(
else
	@echo
endif
