# help.t

```
$ bin/rehearsal -anchor t/t/help.t
1..2
ok 1 Acceptable synonyms of `-help`
ok 2 Unacceptable option
```

# bailout.t

```
$ ./rehearsal -command no-such-command t/t/cat.t
1..1
Bail out!
...
```

# cat.t

```
$ ./rehearsal t/t/cat.t
1..1
ok 1 cat output
```

# cat-fail.t

```
$ ./rehearsal t/t/cat-fail.t
1..3
not ok 1 cat output - line not match
# expected: xxx
# actual: ghi
not ok 2 cat output - less line
# expected <pqr> but reached end
not ok 3 cat output - too match line
# expected end but got <mno>
```

# no-newline.t

```
$ ./rehearsal t/t/no-newline.t
1..2
ok 1 no newline 1
ok 2 no newline 2
```

# no-newline-fail.t

```
$ ./rehearsal t/t/no-newline-fail.t
1..2
not ok 1 no newline 1
# expected: hello world
# actual: hello world!
not ok 2 no newline 2
# expected: hello world
# actual: hello world!
```

# snip.t

```
$ ./rehearsal t/t/snip.t
1..7
ok 1 snip in the middle
ok 2 snip in the beginning
ok 3 snip in the beginning 2
ok 4 snip in the end
ok 5 snip in the end 2
ok 6 mix
ok 7 snip should not match blank lines
```

# snip-fail.t

```
$ ./rehearsal t/t/snip-fail.t
1..3
not ok 1 snip in the middle - fail
# expected <xyz> but reached end
not ok 2 snip in the beginning - fail
# expected <xyz> but reached end
not ok 3 snip in the end - fail
# expected: xyz
# actual: abc
```

# multiplesteps.t

```
$ ./rehearsal t/t/multisteps.t
1..1
ok 1 multiple steps
```
