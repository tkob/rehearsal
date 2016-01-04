# snip in the middle

```
$ cat t/t/cat.txt
abc
...
mno
```

# snip in the beginning

```
$ cat t/t/cat.txt
...
mno
```

# snip in the beginning 2

```
$ cat t/t/cat.txt
...
abc
def
ghi
jkl
mno
```

# snip in the end

```
$ cat t/t/cat.txt
abc
...
```

# snip in the end 2

```
$ cat t/t/cat.txt
abc
def
ghi
jkl
mno
...
```

# mix

```
$ cat t/t/cat.txt
...
abc
...
def
...
ghi
...
jkl
...
mno
...
```

# snip should not match blank lines

```
$ echo; echo abc
...
```

```
$ echo abc; echo; echo def
abc
...
```
