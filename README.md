# Rehearsal

Rehearsal is a light-weight testing framework based on interactive shell (or 'REPL').
You only need to copy-and-paste a session from REPL to a Markdown document and you will get an automated test suite.

## Usage

Let us suppose you are writing software in a language with REPL, such as Python.
While developing a program, you run lots of quick tests on REPL:

```
>>> def greet():
...     print "hello!"
... 
>>> greet()
hello!
```

These 'tests', however, disappear if you exit the REPL session.

With rehearsal, you can repeat such tests just creating a file like this (by copy-and-paste from REPL):

````
# Define and test greet function

```
>>> def greet():
...     print "hello!"
... 
>>> greet()
hello!
```
````

Note: the trailing space after '...' should be preserved.

To run the test (supposing you saved the file above as t/greet.t):

```
$ rehearsal -command python -ps1 '>>> ' -ps2 '\.\.\. ' t/greet.t
1..1
ok 1 Define and test greet function
```

## Command Line Options

See [man page](https://github.com/tkob/rehearsal/blob/master/rehearsal.pod).
