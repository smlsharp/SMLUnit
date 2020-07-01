####################################################################################
#
# SMLUnit
#     SML Unit Testing Framework
# 	
####################################################################################

SMLSHARP_ENV ?= SMLSHARP_HEAPSIZE=128M:1G
SMLSHARP := smlsharp
SMLDOC := smldoc

## search directories
VROOT := .
VPATH := $(VROOT):$(VROOT)/src/main
INCDIR := $(subst :, ,$(VPATH))

## compile options
SMLFLAGS := $(patsubst %,-I%,$(INCDIR))

## source code
SRCS := $(filter-out src/main/ml_bind.sml,$(wildcard src/main/*.sml))

## object file
OBJS    := $(SRCS:.sml=.o)
TARGETS := $(OBJS)

# documents
SMLDOC_ARGFILE := src/smldoc.cfg
DOCDIR := doc/api


all: $(OBJS)


## .o type rules
%.o: %.sml
	@echo " SML# [$(notdir $@)]"
	@$(SMLSHARP_ENV) $(SMLSHARP) $(SMLFLAGS) -o $@ -c $<


## SML depends
%.d: %.sml
	@echo " GEN [$(notdir $@)]"
	@$(SHELL) -ec '$(SMLSHARP_ENV) $(SMLSHARP) -MM $(SMLFLAGS) $< \
		| sed "s|\($*\)\.o[ :]*|\1.o $@ : |g" > $@; \
		[ -s $@ ] || rm -rf $@'


ifeq (,$(findstring $(MAKECMDGOALS),clean))
## include generated dependence
include $(filter %.d,$(SRCS:.sml=.d))
endif

.PHONY: test
test: $(OBJS)
	$(MAKE) -C src/test
	./src/test/testExec
	$(MAKE) -C basis/test
	./basis/test/testExec


.PHONY: example
example: $(OBJS)
	$(MAKE) -C example
	./example/testExec


.PHONY: doc
doc: $(DOCDIR)
	@echo " Doc [$(DOCDIR)]"
	@$(SMLDOC) -a $(SMLDOC_ARGFILE) -d "$(DOCDIR)" -t "SMLUnit"


$(DOCDIR):
	@mkdir -p $(DOCDIR)


.PHONY: clean
clean:
	-$(RM) -r $(TARGETS)
	-$(RM) -r $(SRCS:.sml=.d)
	-$(RM) -r $(DOCDIR)
	$(MAKE) -C src/test   clean
	$(MAKE) -C example    clean
	$(MAKE) -C basis/test clean

