PREFIX ?= $(HOME)/.local
BINDIR := $(PREFIX)/bin

SCRIPT := bowling.awk

.PHONY : test install uninstall

test :
	./scripts/test

install : $(SCRIPT)
	install -m 755 $(SCRIPT) $(BINDIR)/bowling

uninstall :
	rm -f $(BINDIR)/bowling
