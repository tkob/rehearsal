suite {
    command_line {sh}
    prompt {\$ }
    tests {
        {
            desc "snip in the middle"
            steps {
                {cat t/t/cat.txt}
                {
                    -ex {abc}
                    snip {}
                    -ex {mno}
                }
            }
        }
        {
            desc "snip in the beginning"
            steps {
                {cat t/t/cat.txt}
                {
                    snip {}
                    -ex {mno}
                }
            }
        }
        {
            desc "snip in the beginning 2"
            steps {
                {cat t/t/cat.txt}
                {
                    snip {}
                    -ex {abc}
                    -ex {def}
                    -ex {ghi}
                    -ex {jkl}
                    -ex {mno}
                }
            }
        }
        {
            desc "snip in the end"
            steps {
                {cat t/t/cat.txt}
                {
                    -ex {abc}
                    snip {}
                }
            }
        }
        {
            desc "snip in the end 2"
            steps {
                {cat t/t/cat.txt}
                {
                    -ex {abc}
                    -ex {def}
                    -ex {ghi}
                    -ex {jkl}
                    -ex {mno}
                    snip {}
                }
            }
        }
        {
            desc "mix"
            steps {
                {cat t/t/cat.txt}
                {
                    snip {}
                    -ex {abc}
                    snip {}
                    -ex {def}
                    snip {}
                    -ex {ghi}
                    snip {}
                    -ex {jkl}
                    snip {}
                    -ex {mno}
                    snip {}
                }
            }
        }
    }
}
