suite {
    command_line {no-such-command}
    prompt {\$ }
    tests {
        {
            desc "cat output"
            steps {
                {cat t/t/cat.txt}
                {
                    -ex {abc}
                    -ex {def}
                    -ex {ghi}
                    -ex {jkl}
                    -ex {mno}
                }
            }
        }
    }
}
