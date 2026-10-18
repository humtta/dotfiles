function fish_prompt -d "Write out the prompt"
    set -l last_status $status

    set -l normal (set_color normal)
    set -l muted (set_color brblack)
    set -l red (set_color red)
    set -l green (set_color green)
    set -l blue (set_color blue)
    set -l magenta (set_color magenta)

    set -l status_color $green
    if test $last_status -ne 0
        set status_color $red
    end

    printf '%s%s%s %s%s%s ' \
        $muted (date '+%H:%M:%S') $normal \
        $blue (prompt_pwd) $normal

    set -l branch (fish_git_prompt '%s')
    if test -n "$branch"
        printf '%son %s %s%s ' $muted $magenta $branch $normal
    end

    printf '%s%s ' $status_color $normal
end
