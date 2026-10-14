function mkcd -d "Create and navigate to a directory"
    if test (count $argv) -ne 1
        echo "Usage: mkcd path" >&2
        return 1
    end

    set path $argv[1]

    mkdir -p $path
    and cd $path
end
