set timeout 1
suite {
    command_line {sh}
    prompt {\$ }
    tests {
        {
            desc "snip in the middle - fail"
            steps {
                {cat t/t/cat.txt}
                {
                    -ex {abc}
                    snip {}
                    -ex {xyz}
                }
            }
        }
        {
            desc "snip in the beginning - fail"
            steps {
                {cat t/t/cat.txt}
                {
                    snip {}
                    -ex {xyz}
                }
            }
        }
        {
            desc "snip in the end - fail"
            steps {
                {cat t/t/cat.txt}
                {
                    -ex {xyz}
                    snip {}
                }
            }
        }
    }
}
