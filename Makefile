####################################################################################
#
# SMLUnit
#     SML Unit Testing Framework
# 	
####################################################################################

SUBDIR = src/main

.PHONY: $(SUBDIR) doc

all: $(SUBDIR)

$(SUBDIR):
	$(MAKE) -C $@

#
# generate documents...
# ---------------------------------------------------------------------------------
SMLDOC_ARGFILE = src/smldoc.cfg
SMLDOC = smldoc
DOCDIR = doc/api

doc:
	@echo "generate documents..."
	@mkdir -p $(DOCDIR);
	@$(SHELL) -ec ' \
	$(SMLDOC) -a $(SMLDOC_ARGFILE) -d "$(DOCDIR)" -t "SMLUnit"; \
	exit 0'


.PHONY: clean
clean:
	$(MAKE) -C $(SUBDIR) $@
	rm -rf $(DOCDIR)

