VERSION = 0.1.0

check:
	prove -v --exec ./rehearsal

man: man/rehearsal.n

man/rehearsal.n: rehearsal.pod
	pod2man -n rehearsal -r Rehearsal -d $(VERSION) -c "" rehearsal.pod > man/rehearsal.n

clean:
	rm -rf man/rehearsal.n

extra-check: python sml poly smlsharp alice ocaml scala lua ruby

python:
	./rehearsal -command python -ps1 '>>> ' -ps2 '\.\.\. ' t/t/python.t
	./rehearsal -command python -ps1 ">>> " -ps2 '\.\.\. ' -snip '  ...' t/t/python-intro.t

sml:
	./rehearsal -command sml -ps1 '- ' -ps2 '= ' t/t/sml.t

poly:
	./rehearsal -command poly -ps1 '> ' -ps2 '# ' t/t/poly.t

smlsharp:
	./rehearsal -command smlsharp -banner 'SML# .*\n' -ps1 '# ' -ps2 '> ' t/t/smlsharp.t

alice:
	./rehearsal -command alice -ps1 '- ' -ps2 '  ' t/t/alice.t

ocaml:
	./rehearsal -command ocaml -ps1 '# ' -ps2 '  ' t/t/ocaml.t

scala:
	./rehearsal -command 'scala -Xnojline' -ps1 'scala> ' -ps2 '     \| ' t/t/scala.t

lua:
	./rehearsal -command lua -ps1 '> ' -ps2 '>> ' t/t/lua.t

ruby:
	./rehearsal -command irb -ps1 'irb\(main\):\d+:\d+> ' t/t/ruby-quickstart.t
