check:
	prove -v --exec ./rehearsal

python:
	./rehearsal -command python -ps1 '>>> ' -ps2 '\.\.\. ' t/t/python.t

sml:
	./rehearsal -command sml -ps1 '- ' -ps2 '= ' t/t/sml.t

scala:
	./rehearsal -command scala -ps1 'scala> ' -ps2 '     \| ' t/t/scala.t
