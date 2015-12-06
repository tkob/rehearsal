set timeout 1
suite {
    command_line {sh}
    prompt {\$ }
    tests {
        {
            desc "no newline 1"
            steps {
                {printf "hello world"}
                {
                    -ex {hello world}
                }
                {printf "hello world"}
                {
                    -ex {hello world}
                }
            }
        }
        {
            desc "no newline 2"
            steps {
                {printf "hello world"}
                {
                    -ex {hello world}
                }
                {printf "hello world"}
                {
                    -ex {hello world}
                }
            }
        }
    }
}
