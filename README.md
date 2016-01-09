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

    # Define and test greet function
    
    ```
    >>> def greet():
    ...     print "hello!"
    ... 
    >>> greet()
    hello!
    ```

Note: the trailing space after '...' should be preserved.

To run the test (supposing you saved the file above as t/greet.t):

```
$ rehearsal -command python -ps1 '>>> ' -ps2 '\.\.\. ' t/greet.t
1..1
ok 1 Define and test greet function
```

## Installation

### 1. Simple Installation

Rehearsal is a single file Expect script.
So if you have Expect (based on Tcl8.5+) already instlled, all you have to do is
to download [the latest release](https://github.com/tkob/rehearsal/releases)
and extract the executable file `rehearsal`.

### 2. apt-get Installation

Available from [Bintray](https://bintray.com/tkob/deb/rehearsal/view).

```
echo "deb https://dl.bintray.com/tkob/deb {distribution} rehearsal" | sudo tee -a /etc/apt/sources.list
sudo apt-get install rehearsal
```

where `{distribution}` is code name of your Debian/Ubuntu distribution. (e.g. wheezy, trusty...)

You can also download deb file from Bintray.

### 3. yum Installation

Available from [Bintray](https://bintray.com/tkob/rpm/rehearsal/view).

```
wget https://bintray.com/tkob/rpm/rpm -O bintray-tkob-rpm.repo
sudo mv bintray-tkob-rpm.repo /etc/yum.repos.d/
sudo yum install rehearsal
```

You can also download rpm file from Bintray.

## Command Line Options

See [man page](https://github.com/tkob/rehearsal/blob/master/rehearsal.pod).

## Tested Platforms

| Test     | Ubuntu | AIX 7.1  | Solaris 11.2 |
| -------- | ------ | -------- | ------------ |
| ksh      | Yes    | Yes      | Yes          |
| python   | Yes    | Yes [^1] | Yes          |
| ruby     | Yes    |          | Yes          |
| lua      | Yes    |          | Yes          |
| scala    | Yes    |          |              |
| ocaml    | Yes    | Yes      | Yes          |
| sml      | Yes    |          |              |
| poly     | Yes    |          | Yes          |
| smlsharp | Yes    |          |              |
| alice    | Yes    |          |              |
| mosml    | Yes    |          |              |

Blank cells mean 'not tested (unknown)'.

[^1] `make python` does not work out of the box because of encoding problem. Except for that, it works.
