Taken from Python 2.7 documentation and converted into Markdown.

Copyright © 2001-2015 Python Software Foundation; All Rights Reserved

# An Informal Introduction to Python

In the following examples, input and output are distinguished by the
presence or absence of prompts (\>\>\> and ...): to repeat the example,
you must type everything after the prompt, when the prompt appears;
lines that do not begin with a prompt are output from the interpreter.
Note that a secondary prompt on a line by itself in an example means you
must type a blank line; this is used to end a multi-line command.

Many of the examples in this manual, even those entered at the
interactive prompt, include comments. Comments in Python start with the
hash character, `#`, and extend to the end of the physical line. A
comment may appear at the start of a line or following whitespace or
code, but not within a string literal. A hash character within a string
literal is just a hash character. Since comments are to clarify code and
are not interpreted by Python, they may be omitted when typing in
examples.

Some examples:

    # this is the first comment
    spam = 1  # and this is the second comment
              # ... and now a third!
    text = "# This is not a comment because it's inside quotes."

## Using Python as a Calculator

Let's try some simple Python commands. Start the interpreter and wait
for the primary prompt, `>>>`. (It shouldn't take long.)

### Numbers

The interpreter acts as a simple calculator: you can type an expression
at it and it will write the value. Expression syntax is straightforward:
the operators `+`, `-`, `*` and `/` work just like in most other
languages (for example, Pascal or C); parentheses (`()`) can be used for
grouping. For example:

    >>> 2 + 2
    4
    >>> 50 - 5*6
    20
    >>> (50 - 5.0*6) / 4
    5.0
    >>> 8 / 5.0
    1.6

The integer numbers (e.g. `2`, `4`, `20`) have type int, the ones with a
fractional part (e.g. `5.0`, `1.6`) have type float. We will see more
about numeric types later in the tutorial.

The return type of a division (`/`) operation depends on its operands.
If both operands are of type int, floor division is performed and an int
is returned. If either operand is a float, classic division is performed
and a float is returned. The `//` operator is also provided for doing
floor division no matter what the operands are. The remainder can be
calculated with the `%` operator:

    >>> 17 / 3  # int / int -> int
    5
    >>> 17 / 3.0  # int / float -> float
    5.666666666666667
    >>> 17 // 3.0  # explicit floor division discards the fractional part
    5.0
    >>> 17 % 3  # the % operator returns the remainder of the division
    2
    >>> 5 * 3 + 2  # result * divisor + remainder
    17

With Python, it is possible to use the `**` operator to calculate powers
[^1]:

    >>> 5 ** 2  # 5 squared
    25
    >>> 2 ** 7  # 2 to the power of 7
    128

The equal sign (`=`) is used to assign a value to a variable.
Afterwards, no result is displayed before the next interactive prompt:

    >>> width = 20
    >>> height = 5 * 9
    >>> width * height
    900

If a variable is not "defined" (assigned a value), trying to use it will
give you an error:

    >>> n  # try to access an undefined variable
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    NameError: name 'n' is not defined

There is full support for floating point; operators with mixed type
operands convert the integer operand to floating point:

    >>> 3 * 3.75 / 1.5
    7.5
    >>> 7.0 / 2
    3.5

In interactive mode, the last printed expression is assigned to the
variable `_`. This means that when you are using Python as a desk
calculator, it is somewhat easier to continue calculations, for example:

    >>> tax = 12.5 / 100
    >>> price = 100.50
    >>> price * tax
    12.5625
    >>> price + _
    113.0625
    >>> round(_, 2)
    113.06

This variable should be treated as read-only by the user. Don't
explicitly assign a value to it --- you would create an independent
local variable with the same name masking the built-in variable with its
magic behavior.

In addition to int and float, Python supports other types of numbers,
such as \~decimal.Decimal and \~fractions.Fraction. Python also has
built-in support for complex numbers \<typesnumeric\>, and uses the `j`
or `J` suffix to indicate the imaginary part (e.g. `3+5j`).

### Strings

Besides numbers, Python can also manipulate strings, which can be
expressed in several ways. They can be enclosed in single quotes
(`'...'`) or double quotes (`"..."`) with the same result [^2]. `\` can
be used to escape quotes:

    >>> 'spam eggs'  # single quotes
    'spam eggs'
    >>> 'doesn\'t'  # use \' to escape the single quote...
    "doesn't"
    >>> "doesn't"  # ...or use double quotes instead
    "doesn't"
    >>> '"Yes," he said.'
    '"Yes," he said.'
    >>> "\"Yes,\" he said."
    '"Yes," he said.'
    >>> '"Isn\'t," she said.'
    '"Isn\'t," she said.'

In the interactive interpreter, the output string is enclosed in quotes
and special characters are escaped with backslashes. While this might
sometimes look different from the input (the enclosing quotes could
change), the two strings are equivalent. The string is enclosed in
double quotes if the string contains a single quote and no double
quotes, otherwise it is enclosed in single quotes. The print statement
produces a more readable output, by omitting the enclosing quotes and by
printing escaped and special characters:

    >>> '"Isn\'t," she said.'
    '"Isn\'t," she said.'
    >>> print '"Isn\'t," she said.'
    "Isn't," she said.
    >>> s = 'First line.\nSecond line.'  # \n means newline
    >>> s  # without print, \n is included in the output
    'First line.\nSecond line.'
    >>> print s  # with print, \n produces a new line
    First line.
    Second line.

If you don't want characters prefaced by `\` to be interpreted as
special characters, you can use *raw strings* by adding an `r` before
the first quote:

    >>> print 'C:\some\name'  # here \n means newline!
    C:\some
    ame
    >>> print r'C:\some\name'  # note the r before the quote
    C:\some\name

String literals can span multiple lines. One way is using triple-quotes:
`"""..."""` or `'''...'''`. End of lines are automatically included in
the string, but it's possible to prevent this by adding a `\` at the end
of the line. The following example:

    print """\
    Usage: thingy [OPTIONS]
         -h                        Display this usage message
         -H hostname               Hostname to connect to
    """

produces the following output (note that the initial newline is not
included):

~~~~ {.sourceCode .text}
Usage: thingy [OPTIONS]
     -h                        Display this usage message
     -H hostname               Hostname to connect to
~~~~

Strings can be concatenated (glued together) with the `+` operator, and
repeated with `*`:

    >>> 3 * 'un' + 'ium'
    'unununium'

Two or more *string literals* (i.e. the ones enclosed between quotes)
next to each other are automatically concatenated. :

    >>> 'Py' 'thon'
    'Python'

This only works with two literals though, not with variables or
expressions:

    >>> prefix = 'Py'
    >>> prefix 'thon'  # can't concatenate a variable and a string literal
      ...
    SyntaxError: invalid syntax
    >>> ('un' * 3) 'ium'
      ...
    SyntaxError: invalid syntax

If you want to concatenate variables or a variable and a literal, use
`+`:

    >>> prefix + 'thon'
    'Python'

This feature is particularly useful when you want to break long strings:

    >>> text = ('Put several strings within parentheses '
    ...         'to have them joined together.')
    >>> text
    'Put several strings within parentheses to have them joined together.'

Strings can be *indexed* (subscripted), with the first character having
index 0. There is no separate character type; a character is simply a
string of size one:

    >>> word = 'Python'
    >>> word[0]  # character in position 0
    'P'
    >>> word[5]  # character in position 5
    'n'

Indices may also be negative numbers, to start counting from the right:

    >>> word[-1]  # last character
    'n'
    >>> word[-2]  # second-last character
    'o'
    >>> word[-6]
    'P'

Note that since -0 is the same as 0, negative indices start from -1.

In addition to indexing, *slicing* is also supported. While indexing is
used to obtain individual characters, *slicing* allows you to obtain a
substring:

    >>> word[0:2]  # characters from position 0 (included) to 2 (excluded)
    'Py'
    >>> word[2:5]  # characters from position 2 (included) to 5 (excluded)
    'tho'

Note how the start is always included, and the end always excluded. This
makes sure that `s[:i] + s[i:]` is always equal to `s`:

    >>> word[:2] + word[2:]
    'Python'
    >>> word[:4] + word[4:]
    'Python'

Slice indices have useful defaults; an omitted first index defaults to
zero, an omitted second index defaults to the size of the string being
sliced. :

    >>> word[:2]  # character from the beginning to position 2 (excluded)
    'Py'
    >>> word[4:]  # characters from position 4 (included) to the end
    'on'
    >>> word[-2:] # characters from the second-last (included) to the end
    'on'

One way to remember how slices work is to think of the indices as
pointing *between* characters, with the left edge of the first character
numbered 0. Then the right edge of the last character of a string of *n*
characters has index *n*, for example:

    +---+---+---+---+---+---+
    | P | y | t | h | o | n |
    +---+---+---+---+---+---+
    0   1   2   3   4   5   6

> -6 -5 -4 -3 -2 -1

The first row of numbers gives the position of the indices 0...6 in the
string; the second row gives the corresponding negative indices. The
slice from *i* to *j* consists of all characters between the edges
labeled *i* and *j*, respectively.

For non-negative indices, the length of a slice is the difference of the
indices, if both are within bounds. For example, the length of
`word[1:3]` is 2.

Attempting to use a index that is too large will result in an error:

    >>> word[42]  # the word only has 6 characters
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    IndexError: string index out of range

However, out of range slice indexes are handled gracefully when used for
slicing:

    >>> word[4:42]
    'on'
    >>> word[42:]
    ''

Python strings cannot be changed --- they are immutable. Therefore,
assigning to an indexed position in the string results in an error:

    >>> word[0] = 'J'
      ...
    TypeError: 'str' object does not support item assignment
    >>> word[2:] = 'py'
      ...
    TypeError: 'str' object does not support item assignment

If you need a different string, you should create a new one:

    >>> 'J' + word[1:]
    'Jython'
    >>> word[:2] + 'py'
    'Pypy'

The built-in function len returns the length of a string:

    >>> s = 'supercalifragilisticexpialidocious'
    >>> len(s)
    34

### Unicode Strings

Starting with Python 2.0 a new data type for storing text data is
available to the programmer: the Unicode object. It can be used to store
and manipulate Unicode data (see <http://www.unicode.org/>) and
integrates well with the existing string objects, providing
auto-conversions where necessary.

Unicode has the advantage of providing one ordinal for every character
in every script used in modern and ancient texts. Previously, there were
only 256 possible ordinals for script characters. Texts were typically
bound to a code page which mapped the ordinals to script characters.
This lead to very much confusion especially with respect to
internationalization (usually written as `i18n` --- `'i'` + 18
characters + `'n'`) of software. Unicode solves these problems by
defining one code page for all scripts.

Creating Unicode strings in Python is just as simple as creating normal
strings:

    >>> u'Hello World !'
    u'Hello World !'

The small `'u'` in front of the quote indicates that a Unicode string is
supposed to be created. If you want to include special characters in the
string, you can do so by using the Python *Unicode-Escape* encoding. The
following example shows how:

    >>> u'Hello\u0020World !'
    u'Hello World !'

The escape sequence `\u0020` indicates to insert the Unicode character
with the ordinal value 0x0020 (the space character) at the given
position.

Other characters are interpreted by using their respective ordinal
values directly as Unicode ordinals. If you have literal strings in the
standard Latin-1 encoding that is used in many Western countries, you
will find it convenient that the lower 256 characters of Unicode are the
same as the 256 characters of Latin-1.

For experts, there is also a raw mode just like the one for normal
strings. You have to prefix the opening quote with 'ur' to have Python
use the *Raw-Unicode-Escape* encoding. It will only apply the above
`\uXXXX` conversion if there is an uneven number of backslashes in front
of the small 'u'. :

    >>> ur'Hello\u0020World !'
    u'Hello World !'
    >>> ur'Hello\\u0020World !'
    u'Hello\\\\u0020World !'

The raw mode is most useful when you have to enter lots of backslashes,
as can be necessary in regular expressions.

Apart from these standard encodings, Python provides a whole set of
other ways of creating Unicode strings on the basis of a known encoding.

The built-in function unicode provides access to all registered Unicode
codecs (COders and DECoders). Some of the more well known encodings
which these codecs can convert are *Latin-1*, *ASCII*, *UTF-8*, and
*UTF-16*. The latter two are variable-length encodings that store each
Unicode character in one or more bytes. The default encoding is normally
set to ASCII, which passes through characters in the range 0 to 127 and
rejects any other characters with an error. When a Unicode string is
printed, written to a file, or converted with str, conversion takes
place using this default encoding. :

    >>> u"abc"
    u'abc'
    >>> str(u"abc")
    'abc'
    >>> u"äöü"
    u'\xe4\xf6\xfc'
    >>> str(u"äöü")
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    UnicodeEncodeError: 'ascii' codec can't encode characters in position 0-2: ordinal not in range(128)

To convert a Unicode string into an 8-bit string using a specific
encoding, Unicode objects provide an encode method that takes one
argument, the name of the encoding. Lowercase names for encodings are
preferred. :

    >>> u"äöü".encode('utf-8')
    '\xc3\xa4\xc3\xb6\xc3\xbc'

If you have data in a specific encoding and want to produce a
corresponding Unicode string from it, you can use the unicode function
with the encoding name as the second argument. :

    >>> unicode('\xc3\xa4\xc3\xb6\xc3\xbc', 'utf-8')
    u'\xe4\xf6\xfc'

### Lists

Python knows a number of *compound* data types, used to group together
other values. The most versatile is the *list*, which can be written as
a list of comma-separated values (items) between square brackets. Lists
might contain items of different types, but usually the items all have
the same type. :

    >>> squares = [1, 4, 9, 16, 25]
    >>> squares
    [1, 4, 9, 16, 25]

Like strings (and all other built-in sequence type), lists can be
indexed and sliced:

    >>> squares[0]  # indexing returns the item
    1
    >>> squares[-1]
    25
    >>> squares[-3:]  # slicing returns a new list
    [9, 16, 25]

All slice operations return a new list containing the requested
elements. This means that the following slice returns a new (shallow)
copy of the list:

    >>> squares[:]
    [1, 4, 9, 16, 25]

Lists also supports operations like concatenation:

    >>> squares + [36, 49, 64, 81, 100]
    [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

Unlike strings, which are immutable, lists are a mutable type, i.e. it
is possible to change their content:

    >>> cubes = [1, 8, 27, 65, 125]  # something's wrong here
    >>> 4 ** 3  # the cube of 4 is 64, not 65!
    64
    >>> cubes[3] = 64  # replace the wrong value
    >>> cubes
    [1, 8, 27, 64, 125]

You can also add new items at the end of the list, by using the
\~list.append *method* (we will see more about methods later):

    >>> cubes.append(216)  # add the cube of 6
    >>> cubes.append(7 ** 3)  # and the cube of 7
    >>> cubes
    [1, 8, 27, 64, 125, 216, 343]

Assignment to slices is also possible, and this can even change the size
of the list or clear it entirely:

    >>> letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
    >>> letters
    ['a', 'b', 'c', 'd', 'e', 'f', 'g']
    >>> letters[2:5] = ['C', 'D', 'E']
    >>> letters
    ['a', 'b', 'C', 'D', 'E', 'f', 'g']
    >>> letters[2:5] = []
    >>> letters
    ['a', 'b', 'f', 'g']
    >>> letters[:] = []
    >>> letters
    []

The built-in function len also applies to lists:

    >>> letters = ['a', 'b', 'c', 'd']
    >>> len(letters)
    4

It is possible to nest lists (create lists containing other lists), for
example:

    >>> a = ['a', 'b', 'c']
    >>> n = [1, 2, 3]
    >>> x = [a, n]
    >>> x
    [['a', 'b', 'c'], [1, 2, 3]]
    >>> x[0]
    ['a', 'b', 'c']
    >>> x[0][1]
    'b'

# First Steps Towards Programming

Of course, we can use Python for more complicated tasks than adding two
and two together. For instance, we can write an initial sub-sequence of
the *Fibonacci* series as follows:

    >>> # Fibonacci series:
    ... # the sum of two elements defines the next
    ... a, b = 0, 1
    >>> while b < 10:
    ...     print b
    ...     a, b = b, a+b
    ... 
    1
    1
    2
    3
    5
    8

This example introduces several new features.

-   The first line contains a *multiple assignment*: the variables `a`
    and `b` simultaneously get the new values 0 and 1. On the last line
    this is used again, demonstrating that the expressions on the
    right-hand side are all evaluated first before any of the
    assignments take place. The right-hand side expressions are
    evaluated from the left to the right.
-   The while loop executes as long as the condition (here: `b < 10`)
    remains true. In Python, like in C, any non-zero integer value is
    true; zero is false. The condition may also be a string or list
    value, in fact any sequence; anything with a non-zero length is
    true, empty sequences are false. The test used in the example is a
    simple comparison. The standard comparison operators are written the
    same as in C: `<` (less than), `>` (greater than), `==` (equal to),
    `<=` (less than or equal to), `>=` (greater than or equal to) and
    `!=` (not equal to).
-   The *body* of the loop is *indented*: indentation is Python's way of
    grouping statements. At the interactive prompt, you have to type a
    tab or space(s) for each indented line. In practice you will prepare
    more complicated input for Python with a text editor; all decent
    text editors have an auto-indent facility. When a compound statement
    is entered interactively, it must be followed by a blank line to
    indicate completion (since the parser cannot guess when you have
    typed the last line). Note that each line within a basic block must
    be indented by the same amount.
-   The print statement writes the value of the expression(s) it is
    given. It differs from just writing the expression you want to write
    (as we did earlier in the calculator examples) in the way it handles
    multiple expressions and strings. Strings are printed without
    quotes, and a space is inserted between items, so you can format
    things nicely, like this:

    >>> i = 256*256
    >>> print 'The value of i is', i
    The value of i is 65536

    A trailing comma avoids the newline after the output:

    >>> a, b = 0, 1
    >>> while b < 1000:
    ...     print b,
    ...     a, b = b, a+b
    ... 
    1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987

    Note that the interpreter inserts a newline before it prints the
    next prompt if the last line was not completed.

**Footnotes**

[^1]: Since `**` has higher precedence than `-`, `-3**2` will be
    interpreted as `-(3**2)` and thus result in `-9`. To avoid this and
    get `9`, you can use `(-3)**2`.

[^2]: Unlike other languages, special characters such as `\n` have the
    same meaning with both single (`'...'`) and double (`"..."`) quotes.
    The only difference between the two is that within single quotes you
    don't need to escape `"` (but you have to escape `\'`) and vice
    versa.
