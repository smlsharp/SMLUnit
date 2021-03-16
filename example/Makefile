SMLSHARP_ENV = SMLSHARP_HEAPSIZE=128M:1G
SMLSHARP = smlsharp
SMLFLAGS = -O2
ALLOBJECTS = call-main.o Main.o TestDictionary.o Dictionary.o

testExec: $(ALLOBJECTS)
	$(SMLSHARP_ENV) $(SMLSHARP) $(SMLFLAGS) -o testExec call-main.smi

call-main.o: call-main.smi call-main.sml Main.smi

Dictionary.o: Dictionary.sml Dictionary.smi DICTIONARY.sig Dictionary.smi

Main.o: Main.sml Main.smi DICTIONARY.sig Dictionary.smi TestDictionary.smi \
 Main.smi

TestDictionary.o: TestDictionary.sml TestDictionary.smi DICTIONARY.sig \
 Dictionary.smi TestDictionary.smi

.sml.o:
	$(SMLSHARP_ENV) $(SMLSHARP) $(SMLFLAGS) -c -o $@ $<

.SUFFIXES: .sml

clean:
	rm -f $(ALLOBJECTS) testExec

.PHONY: clean
