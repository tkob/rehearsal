set timeout 1
suite {
    command_line {sh}
    prompt {\$ }
    tests {
        {
            desc "cat output - line not match"
            steps {
                {cat t/t/cat.txt}
                {
                    -ex {abc}
                    -ex {def}
                    -ex {xxx}
                    -ex {jkl}
                    -ex {mno}
                }
            }
        }
        {
            desc "cat output - less line"
            steps {
                {cat t/t/cat.txt}
                {
                    -ex {abc}
                    -ex {def}
                    -ex {ghi}
                    -ex {jkl}
                    -ex {mno}
                    -ex {pqr}
                }
            }
        }
        {
            desc "cat output - too match line"
            steps {
                {cat t/t/cat.txt}
                {
                    -ex {abc}
                    -ex {def}
                    -ex {ghi}
                    -ex {jkl}
                }
            }
        }
    }
}
