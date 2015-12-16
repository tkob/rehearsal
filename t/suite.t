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
$ ./rehearsal -timeout 1 t/t/cat-fail.t
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
$ ./rehearsal -timeout 1 t/t/no-newline.t
1..2
ok 1 no newline 1
ok 2 no newline 2
```

# no-newline-fail.t

```
$ ./rehearsal -timeout 1 t/t/no-newline-fail.t
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
1..6
ok 1 snip in the middle
ok 2 snip in the beginning
ok 3 snip in the beginning 2
ok 4 snip in the end
ok 5 snip in the end 2
ok 6 mix
```

# snip-fail.t

```
$ ./rehearsal -timeout 1 t/t/snip-fail.t
1..3
not ok 1 snip in the middle - fail
# expected <xyz> but reached end
not ok 2 snip in the beginning - fail
# expected <xyz> but reached end
not ok 3 snip in the end - fail
# expected: xyz
# actual: abc
```
