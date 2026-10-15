function cdgit -d "Find and navigate to a Git repository"
    if test (count $argv) -gt 1
        echo "Usage: cdgit [query]" >&2
        return 1
    end

    set -l query $argv[1]

    if not command -q fzf
        echo "Error: fzf is not installed" >&2
        return 1
    end

    set -l repos_dir $HOME/Git

    if not test -d $repos_dir
        echo "Error: directory not found: $repos_dir" >&2
        return 1
    end

    set -l repos (
        find $repos_dir -mindepth 3 -maxdepth 3 -name .git 2>/dev/null |
            path dirname |
            path sort |
            string replace "$repos_dir/" ""
    )

    if not set -q repos[1]
        echo "Error: no Git repositories found in '$repos_dir'" >&2
        return 1
    end

    set -l selection

    if set -q query[1]
        set -l matches (printf '%s\n' $repos | fzf --filter $query)

        if not set -q matches[1]
            echo "Error: no repository matches '$query'" >&2
            return 1
        end

        set selection $matches[1]
    else
        set selection (printf '%s\n' $repos | fzf --layout reverse)
        or return
    end

    cd $repos_dir/$selection
end
