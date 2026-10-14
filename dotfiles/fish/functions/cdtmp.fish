function cdtmp -d "Create and navigate to a temporary directory"
    if test (count $argv) -ne 0
        echo "Usage: cdtmp" >&2
        return 1
    end

    cd (mktemp -d)
end
