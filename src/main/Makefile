####################################################################################
#
# SMLUnit
#     SML Unit Testing Framework
# 	
####################################################################################

SMLSHARP = smlsharp

## search directories
VROOT = .
VPATH = $(VROOT):$(VROOT)/src/main
INCDIR = $(patsubst %,-I%,$(subst :, ,$(VPATH)))

## compile options
SMLSHARPFLAGS = $(INCDIR)

## source code
SRCS = \
	  Assert.sml \
	  SMLUnit.sml \
	  Test.sml \
	  TextUITestRunner.sml

## categorise source code
SMLSRCS = $(filter %.sml,$(SRCS))

## categorise object file
OBJS    = $(filter %.o,$(SMLSRCS:.sml=.o))
TARGETS = $(OBJS)

## default targets
all: init $(OBJS)

.PHONY: init
init:
	@echo "compile start..."

## .o type rules
%.o: %.sml
	$(SMLSHARP) $(SMLSHARPFLAGS) -c $<

## generate for SML dependence
%.d: %.sml
	@echo "generate [$@] from [$*]"
	@$(SHELL) -ec '$(SMLSHARP) -MM $(SMLSHARPFLAGS) $< \
		| sed "s/\($*\)\.o[ :]*/\1.o $@ : /g" > $@; \
		[ -s $@ ] || rm -rf $@'


ifeq (,$(findstring $(MAKECMDGOALS),clean))
## include generated dependence
include $(filter %.d,$(SRCS:.sml=.d))
endif

.PHONY: clean
clean:
	rm -rf $(TARGETS)
	rm -rf $($(SRCS:.sml=.d))
	rm -rf $(filter %.d,$(SRCS:.sml=.d))

