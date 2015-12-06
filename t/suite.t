suite {
    command_line {sh}
    prompt {\$ }
    tests {
        {
            desc "bailout.t"
            steps {
                {./rehearsal t/t/bailout.t}
                {
                    -ex {1..1}
                    -ex {Bail out!}
                    snip {}
                }
            }
        }
        {
            desc "cat.t"
            steps {
                {./rehearsal t/t/cat.t}
                {
                    -ex {1..1}
                    -ex {ok 1 cat output}
                }
            }
        }
        {
            desc "cat-fail.t"
            steps {
                {./rehearsal t/t/cat-fail.t}
                {
                    -ex {1..3}
                    -ex {not ok 1 cat output - line not match}
                    -ex {# expected: xxx}
                    -ex {# actual: ghi}
                    -ex {not ok 2 cat output - less line}
                    -ex {# expected: pqr}
                    -ex {# actual: }
                    -ex {not ok 3 cat output - too match line}
                    -ex {# unexpected trailing line: mno}
                }
            }
        }
        {
            desc "no-newline.t"
            steps {
                {./rehearsal t/t/no-newline.t}
                {
                    -ex {1..2}
                    -ex {ok 1 no newline 1}
                    -ex {ok 2 no newline 2}
                }
            }
        }
        {
            desc "no-newline-fail.t"
            steps {
                {./rehearsal t/t/no-newline-fail.t}
                {
                    -ex {1..2}
                    -ex {not ok 1 no newline 1}
                    -ex {# expected: hello world}
                    -ex {# actual: hello world!}
                    -ex {not ok 2 no newline 2}
                    -ex {# expected: hello world}
                    -ex {# actual: hello world!}
                }
            }
        }
        {
            desc "snip.t"
            steps {
                {./rehearsal t/t/snip.t}
                {
                    -ex {1..6}
                    -ex {ok 1 snip in the middle}
                    -ex {ok 2 snip in the beginning}
                    -ex {ok 3 snip in the beginning 2}
                    -ex {ok 4 snip in the end}
                    -ex {ok 5 snip in the end 2}
                    -ex {ok 6 mix}
                }
            }
        }
        {
            desc "snip-fail.t"
            steps {
                {./rehearsal t/t/snip-fail.t}
                {
                    -ex {1..3}
                    -ex {not ok 1 snip in the middle - fail}
                    -ex {# expected: xyz}
                    -ex {# actual: }
                    -ex {not ok 2 snip in the beginning - fail}
                    -ex {# expected: xyz}
                    -ex {# actual: }
                    -ex {not ok 3 snip in the end - fail}
                    -ex {# expected: xyz}
                    -ex {# actual: abc}
                }
            }
        }
    }
}
