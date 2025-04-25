# Aliases
alias hg="history | grep"
alias vi="nvim"
alias vim="nvim"
alias wt="git worktree"

# Functions

# attach tmux
function tat {
    name=$(basename `pwd` | sed -e 's/\.//g')

    if tmux ls 2>&1 | grep "$name"; then
        tmux attach -t "$name"
    elif [ -f .envrc ]; then
        direnv exec / tmux new-session -s "$name"
    else
        tmux new-session -s "$name"
    fi
}

## convert video to GIF
function vtg {
    output="${1%.mov}.gif"
    gifski "$1" -o "$output" --fps 10
}

# Install starship
eval "$(starship init zsh)"
