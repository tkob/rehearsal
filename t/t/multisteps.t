# multiple steps

Show content of `cat.txt` twice.

```
$ cat t/t/cat.txt
abc
def
ghi
jkl
mno
$ cat t/t/cat.txt
abc
def
ghi
jkl
mno
```

Show content of `cat.txt` twice. (use PS2)

```
$ cat t/t/cat.txt
abc
def
ghi
jkl
mno
$ cat \
> t/t/cat.txt
abc
def
ghi
jkl
mno
```

Two successive PS1s.

```
$ printf ""
$ cat t/t/cat.txt
abc
def
ghi
jkl
mno
```
