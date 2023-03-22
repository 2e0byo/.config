function withext
    string join "." (string split "." $argv[1])[..-2] $argv[2]
end
