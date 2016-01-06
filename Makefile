PREFIX = /usr
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man

VERSION = 0.1
MAINTAINER_USER = `git config user.name`
MAINTAINER_EMAIL = `git config user.email`
URL = "https://github.com/tkob/rehearsal"
DESCRIPTION = "A testing framework based on interactive shell"
FPMOPTS = \
	-s dir \
	-n rehearsal \
	-v $(VERSION) \
	-a all \
	-d 'expect' \
	-d 'tcl >= 8.5' \
	-m "$(MAINTAINER_USER) <$(MAINTAINER_EMAIL)>" \
	--vendor "$(MAINTAINER_USER) <$(MAINTAINER_EMAIL)>" \
	--license "The MIT License (MIT)" \
	--url $(URL) \
	--description $(DESCRIPTION) \
	./bin/rehearsal=$(BINDIR)/rehearsal \
	./man/rehearsal.1=$(MANDIR)/man1/rehearsal.1
DEB = rehearsal_$(VERSION)_all.deb
RPM = rehearsal-$(VERSION)-1.noarch.rpm

check: bin/rehearsal
	prove -v --exec bin/rehearsal

bin/rehearsal: rehearsal rehearsal.pod
	awk '{print} /set usage/ {system("pod2usage -verbose 1 rehearsal.pod");}' \
		$< > $@
	chmod +x $@

man/rehearsal.1: rehearsal.pod
	pod2man -n rehearsal -r Rehearsal -d $(VERSION) -c "" rehearsal.pod > man/rehearsal.1

deb: $(DEB)
$(DEB): bin/rehearsal man/rehearsal.1 debian/changelog
	fpm -t deb --deb-changelog debian/changelog $(FPMOPTS)

rpm: $(RPM)
$(RPM): bin/rehearsal man/rehearsal.1
	fpm -t rpm $(FPMOPTS)

tar: rehearsal-$(VERSION).tar.gz
rehearsal-$(VERSION).tar.gz: bin/rehearsal man/rehearsal.1
	fpm -t tar -p rehearsal-$(VERSION).tar $(FPMOPTS)
	gzip rehearsal-$(VERSION).tar

clean:
	rm -rf bin/rehearsal man/rehearsal.1 *.deb *.rpm *.tar.gz *.tar

extra-check: bin/rehearsal python sml poly smlsharp alice mosml ocaml scala lua ruby

python:
	bin/rehearsal -command python -ps1 '>>> ' -ps2 '\.\.\. ' t/t/python.t
	bin/rehearsal -command python -ps1 ">>> " -ps2 '\.\.\. ' -snip '  ...' t/t/python-intro.t

sml:
	bin/rehearsal -command sml -ps1 '- ' -ps2 '= ' t/t/sml.t

poly:
	bin/rehearsal -command poly -ps1 '> ' -ps2 '# ' t/t/poly.t

smlsharp:
	bin/rehearsal -command smlsharp -banner 'SML# .*\n' -ps1 '# ' -ps2 '> ' t/t/smlsharp.t

alice:
	bin/rehearsal -command alice -ps1 '- ' -ps2 '  ' t/t/alice.t

mosml:
	bin/rehearsal -command mosml -ps1 '- ' -ps2 '' t/t/mosml.t

ocaml:
	bin/rehearsal -command ocaml -ps1 '# ' -ps2 '  ' t/t/ocaml.t

scala:
	bin/rehearsal -command 'scala -Xnojline' -ps1 'scala> ' -ps2 '     \| ' t/t/scala.t

lua:
	bin/rehearsal -command lua -ps1 '> ' -ps2 '>> ' t/t/lua.t

ruby:
	bin/rehearsal -command irb -ps1 'irb\(main\):\d+:\d+> ' t/t/ruby-quickstart.t

.PHONY: clean \
	deb rpm tar \
	check \
	extra-check python sml poly smlsharp alice mosml ocaml scala lua ruby
