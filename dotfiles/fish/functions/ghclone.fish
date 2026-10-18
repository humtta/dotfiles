function ghclone -d "Clone a GitHub repository to the right place"
    if test (count $argv) -ne 1
        echo "Usage: ghclone url" >&2
        return 1
    end

    set -l url $argv[1]

    set -l m (string match -r -i '^(?:https://)?github\.com/([^/\s]+)/([^/\s]+?)(?:\.git)?/?$' -- $url)

    if test (count $m) -lt 3
        echo "Error: unsupported URL '$url'" >&2
        return 1
    end

    set -l owner $m[2]
    set -l repo $m[3]

    set -l target "$HOME/Git/$owner/$repo"

    if test -e $target
        echo "Error: directory already exists: $target" >&2
        return 1
    end

    git clone $url $target
end
