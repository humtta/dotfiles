if status is-interactive
    # Keybindings
    bind ctrl-h backward-kill-word
    bind ctrl-delete kill-word

    # Abbreviations for eza
    if command -sq eza
        abbr ls 'eza --icons --group-directories-first'
        abbr ll 'eza --icons --group-directories-first --long --header'
        abbr lo 'eza --icons --group-directories-first --oneline'
        abbr lt 'eza --icons --group-directories-first --tree'
    end

    # Abbreviations for bat
    if command -sq bat
        abbr cat 'bat'
    end
end

# Add to PATH
fish_add_path \
    /home/humtta/.local/bin \
    /home/humtta/.opencode/bin
